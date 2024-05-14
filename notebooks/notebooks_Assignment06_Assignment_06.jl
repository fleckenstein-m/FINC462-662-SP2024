### A Pluto.jl notebook ###
# v0.19.9

using Markdown
using InteractiveUtils

# ╔═╡ 731c88b4-7daf-480d-b163-7003a5fbd41f
begin 
	html"""
	<p align=left style="font-size:36px; font-family:family:Georgia"> <b> FINC 462/662 - Fixed Income Securities</b> <p>
	"""
end

# ╔═╡ a5de5746-3df0-45b4-a62c-3daf36f015a5
begin 
	html"""
	<p style="padding-bottom:1cm"> </p>
	<div align=center style="font-size:25px; font-family:family:Georgia"> FINC-462/662: Fixed Income Securities </div>
	<p style="padding-bottom:1cm"> </p>
	<p align=center style="font-size:25px; font-family:family:Georgia"> <b> Assignment 6</b> <p>
	<p align=center style="font-size:25px; font-family:family:Georgia"> <b> Bond Duration</b> <p>
	<p style="padding-bottom:1cm"> </p>
	<p align=center style="font-size:25px; font-family:family:Georgia"> Spring 2024 <p>
	<p style="padding-bottom:0.5cm"> </p>
	<div align=center style="font-size:20px; font-family:family:Georgia"> Prof. Matt Fleckenstein </div>
	<p style="padding-bottom:0.25cm"> </p>
	<div align=center style="font-size:20px; font-family:family:Georgia"> University of Delaware, 
	Lerner College of Business and Economics </div>
	<p style="padding-bottom:0cm"> </p>
	"""
end

# ╔═╡ 8bcc8106-31e8-4212-8f9e-8800e5737b11
vspace

# ╔═╡ 657e8ee4-5df9-42c1-8639-ba5ab37b51b4
# ╠═╡ show_logs = false
begin
 function getBondPrice(y,c,T,F)
	dt = collect(0.5:0.5:T)
	C = (c/200)*F
	CF = C.*ones(length(dt))
	CF[end] = F+C
	PV = CF./(1+y/200).^(2 .* dt)
	return sum(PV)
 end
	display("")
end

# ╔═╡ a3e50f79-9370-4068-8384-5841c3ba8f3d
# ╠═╡ show_logs = false
begin
 function getModDuration(y,c,T,F)
	P0 = getBondPrice(y,c,T,F)
	deltaY = 0.10 
	Pplus  = getBondPrice(y+deltaY,c,T,F)
	Pminus = getBondPrice(y-deltaY,c,T,F)
	return -(Pplus-Pminus)./(2 * deltaY * P0)
 end
	display("")
end

# ╔═╡ 36e6512e-a077-48ad-8fe8-70a1bd1bed93
md"""
## Exercise 1
"""

# ╔═╡ 982fa9ef-7fdf-4697-a39e-e48ac2ac7ae5
Markdown.parse("
- Calculate the Macaulay Duration **and** the Modified Duration of a Treasury bond with maturity in $(T3) years, coupon rate of $(c3) percent, and face value of \$ $(F3). Suppose the Treasury's yield to maturity is $(y3) percent.
  - You can use Excel to calculate the Macaulay Duration.
")

# ╔═╡ ce1e6bc3-3e22-4163-9c1f-f91976954376
# ╠═╡ show_logs = false
begin
 F3 = 100
 c3 = 2
 y3 = 3
 T3 = 3
 dt3 = collect(0.5:0.5:T3)
 C3 = c3/200*F3	
 C3vec = C3.*ones(length(dt3))
 C3vec[end] = F3 + C3	
 PV3 = getBondPrice(y3,c3,T3,F3)

 D = 0
 w3 = zeros(length(dt3))
 PVC3vec= zeros(length(dt3))	
 for idx=1:length(dt3)
	global w3[idx] = (C3vec[idx]/(1+y3/200)^(2*dt3[idx]))/PV3
	global PVC3vec[idx] = (C3vec[idx]/(1+y3/200)^(2*dt3[idx]))
	global D += dt3[idx] * w3[idx]
 end

 MD = D/(1+y3/200)
 display("")
end

# ╔═╡ dda3cea8-ff3c-45f3-93e9-207bf63f25aa
# ╠═╡ show_logs = false
begin
	str31 = L"D=%$(dt3[1]) \times \frac{\frac{C}{(1+\frac{y}{2})^{2\times %$(dt3[1])}}}{P} + "
	 for idx=2:length(dt3)
		 if idx==length(dt3)
			tmpStr = L"%$(dt3[idx]) \times \frac{\frac{100+C}{(1+\frac{y}{2})^{2\times %$(dt3[idx])}}}{P}"
			global str31 = str31[1:end-1] * tmpStr[2:end]	 
		 else
		 tmpStr = L"%$(dt3[idx]) \times \frac{\frac{C}{(1+\frac{y}{2})^{2\times %$(dt3[idx])}}}{P} + "
		global str31 = str31[1:end-1] * tmpStr[2:end]
		 end
	 end
	
	 str32 = L"D=%$(dt3[1]) \times \frac{\frac{%$(C3)}{(1+\frac{%$(y3)\%}{2})^{2\times %$(dt3[1])}}}{%$(roundmult(PV3,1e-4))} + "
	 for idx=2:length(dt3)
		 if idx==length(dt3)
			tmpStr = L"%$(dt3[idx]) \times \frac{\frac{%$(F3+C3)}{(1+\frac{%$(y3)\%}{2})^{2\times %$(dt3[idx])}}}{%$(roundmult(PV3,1e-4))}"
			global str32 = str32[1:end-1] * tmpStr[2:end]	 
		 else
		 tmpStr = L"%$(dt3[idx]) \times \frac{\frac{%$(C3)}{(1+\frac{%$(y3)\%}{2})^{2\times %$(dt3[idx])}}}{%$(roundmult(PV3,1e-4))} + "
		global str32 = str32[1:end-1] * tmpStr[2:end]
		 end
	 end
	str33 = L"D = %$(roundmult(D,1e-4)) \textrm{ years}"
	
		df3 = DataFrame(Time=dt3, Coupon=C3vec, PVCoupon=PVC3vec,  P=PV3.*ones(length(dt3)),Wt=w3,t_times_Wt=dt3.*w3 )
			
		display("")
end

# ╔═╡ dbffdff4-ffbd-4111-a0a3-8805e2e489ce
Foldable("Solution",Markdown.parse("
- Using the Macaulay Duration formula, we calculate ``D`` as follows
``$str31 ``
- Plugging in the values
``$str32 ``
- Finally, the Macaulay Duration ``D`` is
``$str33``
- The Modified Duration is
``\$MD = \\frac{D}{(1+\\frac{y}{2})} = \\frac{$(roundmult(D,1e-4))}{1+\\frac{$(roundmult(y3/100,1e-3))}{2}} = $(roundmult(MD,1e-4))\$``

"))

# ╔═╡ 02ae383b-c437-47c8-97c1-786130a43adb
vspace

# ╔═╡ e1f618e8-9ad0-436e-b43c-9cbd8e6b5f60
md"""
## Exercise 2
"""

# ╔═╡ 354d2f11-01c8-4d2e-ba6d-c18853018ce7
Markdown.parse("
- Calculate the Modified Duration of a Treasury bond with maturity in $(T5) years, coupon rate of $(c5) percent, and face value of \$ $(F5). Suppose the Treasury's yield to maturity is $(y5) percent. 
  - _To calculate the modified duration, use the approximation formula from class with ``\\Delta y=$deltaY5``% (20 basis points)._
- Compare your results from Exercise 1 and Exercise 2.
- What is percentage change in the price of this bond for a 100 basis point change in the bond's yield?
")

# ╔═╡ 1591fc11-7174-46a8-95d0-0ff9e1ce2424
# ╠═╡ show_logs = false
begin
 F5 = 100
 c5 = 2
 y5 = 3
 T5 = 3
 C5=c5/200*F5
 deltaY5 = 0.20 #percent
 p5 = getBondPrice(y5,c5,T5,F5)
 p5plus	= getBondPrice(y5+deltaY5,c5,T5,F5)
 p5minus = getBondPrice(y5-deltaY5,c5,T5,F5)
 md5 = - (p5plus-p5minus)/(2*(deltaY5/100)*p5)
 display("")
end

# ╔═╡ d3cd8fc8-a3cc-4a42-a8e0-73c06752ddf3
Foldable("Solution",Markdown.parse("

- We pick ``\\Delta y=$deltaY5``% (20 basis points).
1. We calculate ``P(y+\\Delta y)``
 ``\$P(y+\\Delta y)= \\frac{C}{(y+\\Delta y)/2} \\times \\left( 1-\\frac{1}{\\left(1+\\frac{(y+\\Delta y)}{2}\\right)^{2\\times T}} \\right) + \\frac{100}{\\left(1+\\frac{(y+\\Delta y)}{2}\\right)^{2\\times T}}\$``

``\$P(y+\\Delta y)= \\frac{$C5}{$(y3+deltaY5)\\%/2} \\times \\left( 1-\\frac{1}{\\left(1+\\frac{$(y5+deltaY5)\\%}{2}\\right)^{2\\times $T5}} \\right) + \\frac{100}{\\left(1+\\frac{$(y5+deltaY5)\\%}{2}\\right)^{2\\times $T5}}=$(roundmult(p5plus,1e-6))\$``

2. We calculate ``P(y-\\Delta y)``
 ``\$P(y-\\Delta y)= \\frac{C}{(y-\\Delta y)/2} \\times \\left( 1-\\frac{1}{\\left(1+\\frac{(y-\\Delta y)}{2}\\right)^{2\\times T}} \\right) + \\frac{100}{\\left(1+\\frac{(y-\\Delta y)}{2}\\right)^{2\\times T}}\$``

``\$P(y+\\Delta y)= \\frac{$C5}{$(y5-deltaY5)\\%/2} \\times \\left( 1-\\frac{1}{\\left(1+\\frac{$(y5-deltaY5)\\%}{2}\\right)^{2\\times $T5}} \\right) + \\frac{100}{\\left(1+\\frac{$(y5-deltaY5)\\%}{2}\\right)^{2\\times $T5}} =$(roundmult(p5minus,1e-6))\$``

3. We calculate the modified duration ``MD(y)``
``\$MD(y) = - \\frac{P(y+\\Delta y)-P(y-\\Delta y)}{2\\times \\Delta y} \\times \\frac{1}{P(y)}\$``

``\$MD($y5\\%) = - \\frac{$(roundmult(p5plus,1e-4))-$(roundmult(p5minus,1e-4))}{2\\times $(deltaY5/100)} \\times \\frac{1}{$(roundmult(p5,1e-4))}=$(roundmult(md5,1e-6))\$``

- This means that when interest rates increase by 1 percentage point, the price of the bond declines by $(roundmult(md5,1e-2)) percent.

"))

# ╔═╡ ef4da0da-1905-4c7e-bacc-3d782920100b
vspace

# ╔═╡ bdfc509c-1288-45ff-8dd2-15f9f31511b8
md"""
## Exercise 3
"""

# ╔═╡ 6afec959-4488-4a7e-99e9-186057053197
md"""
Which bond will most likely experience the smallest percent change in price if the yields for all three bonds increase by 100 bps?

Bond    |    Price    |    Coupon Rate    | Time-to-Maturity $T$
:-------|:------------|:------------------|:-----------------------
A       | 101.886     | 5%                | 2 years   
B       | 100.000     | 6%                | 2 years   
C       | 97.327      | 5%                | 3 years   
"""

# ╔═╡ 9510d176-a1e0-44b0-a584-08855d257e40
vspace

# ╔═╡ 2163ac0a-301f-455d-bc07-8fa2873aa59f
Foldable("Solution",
md"""
- Bond C, which has the longest maturity, is likely to have the largest modified  duration, so is not the answer.
- Bonds A and B have the same maturity, but B has higher coupons, so B should have a lower modified duration than Bond A.
- Thus, B is likely to have a lower modified duration than A and the answer is Bond B.
""")

# ╔═╡ e1342341-a348-453c-894f-dfbe857eb4db
vspace

# ╔═╡ c7d4ecf0-d78d-4666-a07f-380c3265c96a
md"""
## Exercise 4
"""

# ╔═╡ 19c41dd1-0155-4aa1-88ba-2cb4c4e35595
md"""
Suppose that the term structure of interest rates is:

| t | 0.5   | 1      |   1.5   | 2     |
|:--|:------|:-------|:---------|:-----|
| r | 1%    | 1.2%   |   1.4%  | 1.8%  |

Interest rates are annual interest rates that are __semi-annually__ compounded.
1. Calculate the price and modified duration of a 1-year bond with a 6% coupon rate, with coupons paid semi-annually. The bond has a face value of $100.
2. Calculate the price and modified duration of a 2-year bond with a 10% coupon rate, with coupons paid semi-annually. The bond has a face value of $100.
3. Calculate the modified duration of a portfolio that consists of one unit each of the bonds in part 1 and part 2 above.
"""

# ╔═╡ 6ebbd3a5-5c68-494b-8c56-82d958d8bee8
vspace

# ╔═╡ 2ec3879c-2220-4ba5-aea9-6bf4ad6a5c29
Foldable("Solution to Part 1",Markdown.parse("
We use \$\\Delta y = 0.1\\%\$ (10 basis points).

\$\\begin{aligned}
&P(y) = \\frac{3}{(1+\\frac{1\\%}{2})^{2\\times 0.5}} + \\frac{103}{(1+\\frac{1.2\\%}{2})^{2\\times 1.0}} = 104.76\\\\
&P(y + \\Delta y) = \\frac{3}{(1+\\frac{1.1\\%}{2})^{2\\times 0.5}} + \\frac{103}{(1+\\frac{1.3\\%}{2})^{2\\times 1.0}}= 104.6575\\\\
&P(y - \\Delta y) = \\frac{3}{(1+\\frac{0.9\\%}{2})^{2\\times 0.5}} + \\frac{103}{(1+\\frac{1.1\\%}{2})^{2\\times 1.0}}= 104.8528\\\\
&MD \\approx -\\frac{104.6575 - 104.8628}{2\\times .001}\\times\\frac{1}{104.76} = 0.9784
\\end{aligned}\$
"))

# ╔═╡ c8580960-58ca-4324-9593-57db48ccdc1e
Foldable("Solution to Part 2",Markdown.parse("
We use \$\\Delta y = 0.1\\%\$ (10 basis points).

\$\\begin{aligned}
&P(y) = \\frac{5}{(1+\\frac{1\\%}{2})^{2\\times 0.5}} + \\frac{5}{(1+\\frac{1.2\\%}{2})^{2\\times 1.0}} + 
\\frac{5}{(1+\\frac{1.4\\%}{2})^{2\\times 1.5}} + \\frac{105}{(1+\\frac{1.8\\%}{2})^{2\\times 2.0}} = 116.12\\\\

&P(y+\\Delta y) = \\frac{5}{(1+\\frac{1.1\\%}{2})^{2\\times 0.5}} + \\frac{5}{(1+\\frac{1.3\\%}{2})^{2\\times 1.0}} + 
\\frac{5}{(1+\\frac{1.5\\%}{2})^{2\\times 1.5}} + \\frac{105}{(1+\\frac{1.9\\%}{2})^{2\\times 2.0}} = 115.9004\\\\
&P(y-\\Delta y) = \\frac{5}{(1+\\frac{0.9\\%}{2})^{2\\times 0.5}} + \\frac{5}{(1+\\frac{1.1\\%}{2})^{2\\times 1.0}} + 
\\frac{5}{(1+\\frac{1.3\\%}{2})^{2\\times 1.5}} + \\frac{105}{(1+\\frac{1.7\\%}{2})^{2\\times 2.0}} = 116.3314
\\\\
&MD \\approx -\\frac{115.9004 - 116.3314}{2\\times .001}\\times\\frac{1}{116.12} = 1.8558
\\end{aligned}\$


"))

# ╔═╡ 2c63c47c-307a-4844-8cf2-9c44982ac5cd
Foldable("Solution to Part 3",Markdown.parse("
\$\\begin{aligned}
&w_{1yr} = \\frac{104.76}{104.76+116.12} = 0.4743\\\\
&w_{2yr} = \\frac{116.12}{104.76+116.12} = 0.5257\\\\
&MD = 0.4743\\times(0.9784) + 0.5257\\times(1.8558) = 1.44
\\end{aligned}\$
"))

# ╔═╡ 0008a21c-49dc-4ee0-bc27-ca100e599278
vspace

# ╔═╡ 1bae6b88-9b8c-42a7-8abe-981a46714219
md"""
## Exercise 5
"""

# ╔═╡ b22ded79-21d4-460f-a5d0-7951957473af
Markdown.parse("
- Suppose you own a portfolio of __zero-coupon bonds__. All yields are __annually__ compounded. Calculate the modified duration of the bond portfolio given in the table below.

Bond   |  Maturity     | Yield          | Face value 
:------|:--------------|:---------------|:-------------
H      | $(matVec8[1]) | $(yVec8[1])%   | $(fVec8[1])
I      | $(matVec8[2]) | $(yVec8[2])%   | $(fVec8[2])
J      | $(matVec8[3]) | $(yVec8[3])%   | $(fVec8[3])
K      | $(matVec8[4]) | $(yVec8[4])%   | $(fVec8[4])
L      | $(matVec8[5]) | $(yVec8[5])%   | $(fVec8[5])

")

# ╔═╡ 2ef23d43-033b-4e3d-842b-36f6d7f3f91c
# ╠═╡ show_logs = false
begin
	matVec8 = [1,2,3,4,5]
	yVec8 = [1.25,1.5,2.25,3.25,4.75]
	fVec8 = [100,100,100,100,100]
	pVec8 = 100 ./ (1 .+ yVec8/100).^matVec8
	nB8 = fVec8./100
	MD8 = matVec8 ./ (1 .+ (yVec8./100) )
	Pb8 = sum((nB8 .* pVec8))
	wB8 = (nB8 .* pVec8) ./ Pb8
	df8 = DataFrame(Bond=["H","I","J","K","L"],Maturity=matVec8,Yield=yVec8,FaceValue=fVec8,PricePer100=pVec8,nB=nB8, MD=MD8, Pb =Pb8, wb=wB8, wB_MD=wB8.*MD8)
	display("")
end

# ╔═╡ 5a5cfed2-6017-4a05-9f3f-b93d0bdc81a2
md"""
**Solution**
"""

# ╔═╡ b01e826e-acc1-4684-a2d1-fdb53946cdf3
df8[:,1:10]

# ╔═╡ e52b3706-8bc7-49aa-b154-0aca6560d8ac
Markdown.parse("
``\$MD_{\\textrm{Portfolio}} = $(roundmult(df8.wB_MD[1],1e-4)) + $(roundmult(df8.wB_MD[2],1e-4)) + $(roundmult(df8.wB_MD[3],1e-4)) + $(roundmult(df8.wB_MD[4],1e-4)) + $(roundmult(df8.wB_MD[5],1e-4))\$``

``\$MD_{\\textrm{Portfolio}} = $(roundmult(sum(df8.wB_MD),1e-6))\$``
")


# ╔═╡ 7fa2dc91-127d-43e9-a2ed-d7b36d27ce1e
vspace

# ╔═╡ 9dba51e3-0738-40a1-96d8-f5583cdc5729
# ╠═╡ show_logs = false
begin
	#using Pkg
	#Pkg.upgrade_manifest()
	#Pkg.resolve()
	#Pkg.update()
	
	using DataFrames, HTTP,  Dates, PlutoUI, Printf, LaTeXStrings, HypertextLiteral

	
	#Define html elements
	nbsp = html"&nbsp" #non-breaking space
	vspace = html"""<div style="margin-bottom:2cm;"></div>"""
	br = html"<br>"

	#Sets the height of displayed tables
	html"""<style>
		pluto-output.scroll_y {
			max-height: 650px; /* changed this from 400 to 550 */
		}
		"""
	
	#Two-column cell
	struct TwoColumn{A, B}
		left::A
		right::B
	end
	
	function Base.show(io, mime::MIME"text/html", tc::TwoColumn)
		write(io,
			"""
			<div style="display: flex;">
				<div style="flex: 50%;">
			""")
		show(io, mime, tc.left)
		write(io,
			"""
				</div>
				<div style="flex: 50%;">
			""")
		show(io, mime, tc.right)
		write(io,
			"""
				</div>
			</div>
		""")
	end

	#Creates a foldable cell
	struct Foldable{C}
		title::String
		content::C
	end
	
	function Base.show(io, mime::MIME"text/html", fld::Foldable)
		write(io,"<details><summary>$(fld.title)</summary><p>")
		show(io, mime, fld.content)
		write(io,"</p></details>")
	end
	
	
	#helper functions
	#round to digits, e.g. 6 digits then prec=1e-6
	roundmult(val, prec) = (inv_prec = 1 / prec; round(val * inv_prec) / inv_prec); 

	using Logging
	global_logger(NullLogger());
	#display("")
	#Sets the width of Pluto cells
		#Note: put this last here.
		html"""
			<style>
				main {
					margin: 0 auto;
					max-width: 1050px;
			    	padding-left: max(40px, 1%);
			    	padding-right: max(40px, 1%);
				}
			</style>
		"""
end

# ╔═╡ 00000000-0000-0000-0000-000000000001
PLUTO_PROJECT_TOML_CONTENTS = """
[deps]
DataFrames = "a93c6f00-e57d-5684-b7b6-d8193f3e46c0"
Dates = "ade2ca70-3891-5945-98fb-dc099432e06a"
HTTP = "cd3eb016-35fb-5094-929b-558a96fad6f3"
HypertextLiteral = "ac1192a8-f4b3-4bfe-ba22-af5b92cd3ab2"
LaTeXStrings = "b964fa9f-0449-5b57-a5c2-d3ea65f4040f"
Logging = "56ddb016-857b-54e1-b83d-db4d58db5568"
PlutoUI = "7f904dfe-b85e-4ff6-b463-dae2292396a8"
Printf = "de0858da-6303-5e67-8744-51eddeeeb8d7"

[compat]
DataFrames = "~1.6.1"
HTTP = "~1.10.4"
HypertextLiteral = "~0.9.5"
LaTeXStrings = "~1.3.1"
PlutoUI = "~0.7.58"
"""

# ╔═╡ 00000000-0000-0000-0000-000000000002
PLUTO_MANIFEST_TOML_CONTENTS = """
# This file is machine-generated - editing it directly is not advised

julia_version = "1.10.2"
manifest_format = "2.0"
project_hash = "39e6c4e61f9431a4501a9a988651df31f2e328f2"

[[deps.AbstractPlutoDingetjes]]
deps = ["Pkg"]
git-tree-sha1 = "0f748c81756f2e5e6854298f11ad8b2dfae6911a"
uuid = "6e696c72-6542-2067-7265-42206c756150"
version = "1.3.0"

[[deps.ArgTools]]
uuid = "0dad84c5-d112-42e6-8d28-ef12dabb789f"
version = "1.1.1"

[[deps.Artifacts]]
uuid = "56f22d72-fd6d-98f1-02f0-08ddc0907c33"

[[deps.Base64]]
uuid = "2a0f44e3-6c83-55bd-87e4-b1978d98bd5f"

[[deps.BitFlags]]
git-tree-sha1 = "2dc09997850d68179b69dafb58ae806167a32b1b"
uuid = "d1d4a3ce-64b1-5f1a-9ba4-7e7e69966f35"
version = "0.1.8"

[[deps.CodecZlib]]
deps = ["TranscodingStreams", "Zlib_jll"]
git-tree-sha1 = "59939d8a997469ee05c4b4944560a820f9ba0d73"
uuid = "944b1d66-785c-5afd-91f1-9de20f533193"
version = "0.7.4"

[[deps.ColorTypes]]
deps = ["FixedPointNumbers", "Random"]
git-tree-sha1 = "eb7f0f8307f71fac7c606984ea5fb2817275d6e4"
uuid = "3da002f7-5984-5a60-b8a6-cbb66c0b333f"
version = "0.11.4"

[[deps.Compat]]
deps = ["TOML", "UUIDs"]
git-tree-sha1 = "c955881e3c981181362ae4088b35995446298b80"
uuid = "34da2185-b29b-5c13-b0c7-acf172513d20"
version = "4.14.0"
weakdeps = ["Dates", "LinearAlgebra"]

    [deps.Compat.extensions]
    CompatLinearAlgebraExt = "LinearAlgebra"

[[deps.CompilerSupportLibraries_jll]]
deps = ["Artifacts", "Libdl"]
uuid = "e66e0078-7015-5450-92f7-15fbd957f2ae"
version = "1.1.0+0"

[[deps.ConcurrentUtilities]]
deps = ["Serialization", "Sockets"]
git-tree-sha1 = "6cbbd4d241d7e6579ab354737f4dd95ca43946e1"
uuid = "f0e56b4a-5159-44fe-b623-3e5288b988bb"
version = "2.4.1"

[[deps.Crayons]]
git-tree-sha1 = "249fe38abf76d48563e2f4556bebd215aa317e15"
uuid = "a8cc5b0e-0ffa-5ad4-8c14-923d3ee1735f"
version = "4.1.1"

[[deps.DataAPI]]
git-tree-sha1 = "abe83f3a2f1b857aac70ef8b269080af17764bbe"
uuid = "9a962f9c-6df0-11e9-0e5d-c546b8b5ee8a"
version = "1.16.0"

[[deps.DataFrames]]
deps = ["Compat", "DataAPI", "DataStructures", "Future", "InlineStrings", "InvertedIndices", "IteratorInterfaceExtensions", "LinearAlgebra", "Markdown", "Missings", "PooledArrays", "PrecompileTools", "PrettyTables", "Printf", "REPL", "Random", "Reexport", "SentinelArrays", "SortingAlgorithms", "Statistics", "TableTraits", "Tables", "Unicode"]
git-tree-sha1 = "04c738083f29f86e62c8afc341f0967d8717bdb8"
uuid = "a93c6f00-e57d-5684-b7b6-d8193f3e46c0"
version = "1.6.1"

[[deps.DataStructures]]
deps = ["Compat", "InteractiveUtils", "OrderedCollections"]
git-tree-sha1 = "0f4b5d62a88d8f59003e43c25a8a90de9eb76317"
uuid = "864edb3b-99cc-5e75-8d2d-829cb0a9cfe8"
version = "0.18.18"

[[deps.DataValueInterfaces]]
git-tree-sha1 = "bfc1187b79289637fa0ef6d4436ebdfe6905cbd6"
uuid = "e2d170a0-9d28-54be-80f0-106bbe20a464"
version = "1.0.0"

[[deps.Dates]]
deps = ["Printf"]
uuid = "ade2ca70-3891-5945-98fb-dc099432e06a"

[[deps.Downloads]]
deps = ["ArgTools", "FileWatching", "LibCURL", "NetworkOptions"]
uuid = "f43a241f-c20a-4ad4-852c-f6b1247861c6"
version = "1.6.0"

[[deps.ExceptionUnwrapping]]
deps = ["Test"]
git-tree-sha1 = "dcb08a0d93ec0b1cdc4af184b26b591e9695423a"
uuid = "460bff9d-24e4-43bc-9d9f-a8973cb893f4"
version = "0.1.10"

[[deps.FileWatching]]
uuid = "7b1f6079-737a-58dc-b8bc-7a2ca5c1b5ee"

[[deps.FixedPointNumbers]]
deps = ["Statistics"]
git-tree-sha1 = "335bfdceacc84c5cdf16aadc768aa5ddfc5383cc"
uuid = "53c48c17-4a7d-5ca2-90c5-79b7896eea93"
version = "0.8.4"

[[deps.Future]]
deps = ["Random"]
uuid = "9fa8497b-333b-5362-9e8d-4d0656e87820"

[[deps.HTTP]]
deps = ["Base64", "CodecZlib", "ConcurrentUtilities", "Dates", "ExceptionUnwrapping", "Logging", "LoggingExtras", "MbedTLS", "NetworkOptions", "OpenSSL", "Random", "SimpleBufferStream", "Sockets", "URIs", "UUIDs"]
git-tree-sha1 = "995f762e0182ebc50548c434c171a5bb6635f8e4"
uuid = "cd3eb016-35fb-5094-929b-558a96fad6f3"
version = "1.10.4"

[[deps.Hyperscript]]
deps = ["Test"]
git-tree-sha1 = "179267cfa5e712760cd43dcae385d7ea90cc25a4"
uuid = "47d2ed2b-36de-50cf-bf87-49c2cf4b8b91"
version = "0.0.5"

[[deps.HypertextLiteral]]
deps = ["Tricks"]
git-tree-sha1 = "7134810b1afce04bbc1045ca1985fbe81ce17653"
uuid = "ac1192a8-f4b3-4bfe-ba22-af5b92cd3ab2"
version = "0.9.5"

[[deps.IOCapture]]
deps = ["Logging", "Random"]
git-tree-sha1 = "8b72179abc660bfab5e28472e019392b97d0985c"
uuid = "b5f81e59-6552-4d32-b1f0-c071b021bf89"
version = "0.2.4"

[[deps.InlineStrings]]
deps = ["Parsers"]
git-tree-sha1 = "9cc2baf75c6d09f9da536ddf58eb2f29dedaf461"
uuid = "842dd82b-1e85-43dc-bf29-5d0ee9dffc48"
version = "1.4.0"

[[deps.InteractiveUtils]]
deps = ["Markdown"]
uuid = "b77e0a4c-d291-57a0-90e8-8db25a27a240"

[[deps.InvertedIndices]]
git-tree-sha1 = "0dc7b50b8d436461be01300fd8cd45aa0274b038"
uuid = "41ab1584-1d38-5bbf-9106-f11c6c58b48f"
version = "1.3.0"

[[deps.IteratorInterfaceExtensions]]
git-tree-sha1 = "a3f24677c21f5bbe9d2a714f95dcd58337fb2856"
uuid = "82899510-4779-5014-852e-03e436cf321d"
version = "1.0.0"

[[deps.JLLWrappers]]
deps = ["Artifacts", "Preferences"]
git-tree-sha1 = "7e5d6779a1e09a36db2a7b6cff50942a0a7d0fca"
uuid = "692b3bcd-3c85-4b1f-b108-f13ce0eb3210"
version = "1.5.0"

[[deps.JSON]]
deps = ["Dates", "Mmap", "Parsers", "Unicode"]
git-tree-sha1 = "31e996f0a15c7b280ba9f76636b3ff9e2ae58c9a"
uuid = "682c06a0-de6a-54ab-a142-c8b1cf79cde6"
version = "0.21.4"

[[deps.LaTeXStrings]]
git-tree-sha1 = "50901ebc375ed41dbf8058da26f9de442febbbec"
uuid = "b964fa9f-0449-5b57-a5c2-d3ea65f4040f"
version = "1.3.1"

[[deps.LibCURL]]
deps = ["LibCURL_jll", "MozillaCACerts_jll"]
uuid = "b27032c2-a3e7-50c8-80cd-2d36dbcbfd21"
version = "0.6.4"

[[deps.LibCURL_jll]]
deps = ["Artifacts", "LibSSH2_jll", "Libdl", "MbedTLS_jll", "Zlib_jll", "nghttp2_jll"]
uuid = "deac9b47-8bc7-5906-a0fe-35ac56dc84c0"
version = "8.4.0+0"

[[deps.LibGit2]]
deps = ["Base64", "LibGit2_jll", "NetworkOptions", "Printf", "SHA"]
uuid = "76f85450-5226-5b5a-8eaa-529ad045b433"

[[deps.LibGit2_jll]]
deps = ["Artifacts", "LibSSH2_jll", "Libdl", "MbedTLS_jll"]
uuid = "e37daf67-58a4-590a-8e99-b0245dd2ffc5"
version = "1.6.4+0"

[[deps.LibSSH2_jll]]
deps = ["Artifacts", "Libdl", "MbedTLS_jll"]
uuid = "29816b5a-b9ab-546f-933c-edad1886dfa8"
version = "1.11.0+1"

[[deps.Libdl]]
uuid = "8f399da3-3557-5675-b5ff-fb832c97cbdb"

[[deps.LinearAlgebra]]
deps = ["Libdl", "OpenBLAS_jll", "libblastrampoline_jll"]
uuid = "37e2e46d-f89d-539d-b4ee-838fcccc9c8e"

[[deps.Logging]]
uuid = "56ddb016-857b-54e1-b83d-db4d58db5568"

[[deps.LoggingExtras]]
deps = ["Dates", "Logging"]
git-tree-sha1 = "c1dd6d7978c12545b4179fb6153b9250c96b0075"
uuid = "e6f89c97-d47a-5376-807f-9c37f3926c36"
version = "1.0.3"

[[deps.MIMEs]]
git-tree-sha1 = "65f28ad4b594aebe22157d6fac869786a255b7eb"
uuid = "6c6e2e6c-3030-632d-7369-2d6c69616d65"
version = "0.1.4"

[[deps.Markdown]]
deps = ["Base64"]
uuid = "d6f4376e-aef5-505a-96c1-9c027394607a"

[[deps.MbedTLS]]
deps = ["Dates", "MbedTLS_jll", "MozillaCACerts_jll", "NetworkOptions", "Random", "Sockets"]
git-tree-sha1 = "c067a280ddc25f196b5e7df3877c6b226d390aaf"
uuid = "739be429-bea8-5141-9913-cc70e7f3736d"
version = "1.1.9"

[[deps.MbedTLS_jll]]
deps = ["Artifacts", "Libdl"]
uuid = "c8ffd9c3-330d-5841-b78e-0817d7145fa1"
version = "2.28.2+1"

[[deps.Missings]]
deps = ["DataAPI"]
git-tree-sha1 = "f66bdc5de519e8f8ae43bdc598782d35a25b1272"
uuid = "e1d29d7a-bbdc-5cf2-9ac0-f12de2c33e28"
version = "1.1.0"

[[deps.Mmap]]
uuid = "a63ad114-7e13-5084-954f-fe012c677804"

[[deps.MozillaCACerts_jll]]
uuid = "14a3606d-f60d-562e-9121-12d972cd8159"
version = "2023.1.10"

[[deps.NetworkOptions]]
uuid = "ca575930-c2e3-43a9-ace4-1e988b2c1908"
version = "1.2.0"

[[deps.OpenBLAS_jll]]
deps = ["Artifacts", "CompilerSupportLibraries_jll", "Libdl"]
uuid = "4536629a-c528-5b80-bd46-f80d51c5b363"
version = "0.3.23+4"

[[deps.OpenSSL]]
deps = ["BitFlags", "Dates", "MozillaCACerts_jll", "OpenSSL_jll", "Sockets"]
git-tree-sha1 = "af81a32750ebc831ee28bdaaba6e1067decef51e"
uuid = "4d8831e6-92b7-49fb-bdf8-b643e874388c"
version = "1.4.2"

[[deps.OpenSSL_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl"]
git-tree-sha1 = "60e3045590bd104a16fefb12836c00c0ef8c7f8c"
uuid = "458c3c95-2e84-50aa-8efc-19380b2a3a95"
version = "3.0.13+0"

[[deps.OrderedCollections]]
git-tree-sha1 = "dfdf5519f235516220579f949664f1bf44e741c5"
uuid = "bac558e1-5e72-5ebc-8fee-abe8a469f55d"
version = "1.6.3"

[[deps.Parsers]]
deps = ["Dates", "PrecompileTools", "UUIDs"]
git-tree-sha1 = "8489905bcdbcfac64d1daa51ca07c0d8f0283821"
uuid = "69de0a69-1ddd-5017-9359-2bf0b02dc9f0"
version = "2.8.1"

[[deps.Pkg]]
deps = ["Artifacts", "Dates", "Downloads", "FileWatching", "LibGit2", "Libdl", "Logging", "Markdown", "Printf", "REPL", "Random", "SHA", "Serialization", "TOML", "Tar", "UUIDs", "p7zip_jll"]
uuid = "44cfe95a-1eb2-52ea-b672-e2afdf69b78f"
version = "1.10.0"

[[deps.PlutoUI]]
deps = ["AbstractPlutoDingetjes", "Base64", "ColorTypes", "Dates", "FixedPointNumbers", "Hyperscript", "HypertextLiteral", "IOCapture", "InteractiveUtils", "JSON", "Logging", "MIMEs", "Markdown", "Random", "Reexport", "URIs", "UUIDs"]
git-tree-sha1 = "71a22244e352aa8c5f0f2adde4150f62368a3f2e"
uuid = "7f904dfe-b85e-4ff6-b463-dae2292396a8"
version = "0.7.58"

[[deps.PooledArrays]]
deps = ["DataAPI", "Future"]
git-tree-sha1 = "36d8b4b899628fb92c2749eb488d884a926614d3"
uuid = "2dfb63ee-cc39-5dd5-95bd-886bf059d720"
version = "1.4.3"

[[deps.PrecompileTools]]
deps = ["Preferences"]
git-tree-sha1 = "5aa36f7049a63a1528fe8f7c3f2113413ffd4e1f"
uuid = "aea7be01-6a6a-4083-8856-8a6e6704d82a"
version = "1.2.1"

[[deps.Preferences]]
deps = ["TOML"]
git-tree-sha1 = "9306f6085165d270f7e3db02af26a400d580f5c6"
uuid = "21216c6a-2e73-6563-6e65-726566657250"
version = "1.4.3"

[[deps.PrettyTables]]
deps = ["Crayons", "LaTeXStrings", "Markdown", "PrecompileTools", "Printf", "Reexport", "StringManipulation", "Tables"]
git-tree-sha1 = "88b895d13d53b5577fd53379d913b9ab9ac82660"
uuid = "08abe8d2-0d0c-5749-adfa-8a2ac140af0d"
version = "2.3.1"

[[deps.Printf]]
deps = ["Unicode"]
uuid = "de0858da-6303-5e67-8744-51eddeeeb8d7"

[[deps.REPL]]
deps = ["InteractiveUtils", "Markdown", "Sockets", "Unicode"]
uuid = "3fa0cd96-eef1-5676-8a61-b3b8758bbffb"

[[deps.Random]]
deps = ["SHA"]
uuid = "9a3f8284-a2c9-5f02-9a11-845980a1fd5c"

[[deps.Reexport]]
git-tree-sha1 = "45e428421666073eab6f2da5c9d310d99bb12f9b"
uuid = "189a3867-3050-52da-a836-e630ba90ab69"
version = "1.2.2"

[[deps.SHA]]
uuid = "ea8e919c-243c-51af-8825-aaa63cd721ce"
version = "0.7.0"

[[deps.SentinelArrays]]
deps = ["Dates", "Random"]
git-tree-sha1 = "0e7508ff27ba32f26cd459474ca2ede1bc10991f"
uuid = "91c51154-3ec4-41a3-a24f-3f23e20d615c"
version = "1.4.1"

[[deps.Serialization]]
uuid = "9e88b42a-f829-5b0c-bbe9-9e923198166b"

[[deps.SimpleBufferStream]]
git-tree-sha1 = "874e8867b33a00e784c8a7e4b60afe9e037b74e1"
uuid = "777ac1f9-54b0-4bf8-805c-2214025038e7"
version = "1.1.0"

[[deps.Sockets]]
uuid = "6462fe0b-24de-5631-8697-dd941f90decc"

[[deps.SortingAlgorithms]]
deps = ["DataStructures"]
git-tree-sha1 = "66e0a8e672a0bdfca2c3f5937efb8538b9ddc085"
uuid = "a2af1166-a08f-5f64-846c-94a0d3cef48c"
version = "1.2.1"

[[deps.SparseArrays]]
deps = ["Libdl", "LinearAlgebra", "Random", "Serialization", "SuiteSparse_jll"]
uuid = "2f01184e-e22b-5df5-ae63-d93ebab69eaf"
version = "1.10.0"

[[deps.Statistics]]
deps = ["LinearAlgebra", "SparseArrays"]
uuid = "10745b16-79ce-11e8-11f9-7d13ad32a3b2"
version = "1.10.0"

[[deps.StringManipulation]]
deps = ["PrecompileTools"]
git-tree-sha1 = "a04cabe79c5f01f4d723cc6704070ada0b9d46d5"
uuid = "892a3eda-7b42-436c-8928-eab12a02cf0e"
version = "0.3.4"

[[deps.SuiteSparse_jll]]
deps = ["Artifacts", "Libdl", "libblastrampoline_jll"]
uuid = "bea87d4a-7f5b-5778-9afe-8cc45184846c"
version = "7.2.1+1"

[[deps.TOML]]
deps = ["Dates"]
uuid = "fa267f1f-6049-4f14-aa54-33bafae1ed76"
version = "1.0.3"

[[deps.TableTraits]]
deps = ["IteratorInterfaceExtensions"]
git-tree-sha1 = "c06b2f539df1c6efa794486abfb6ed2022561a39"
uuid = "3783bdb8-4a98-5b6b-af9a-565f29a5fe9c"
version = "1.0.1"

[[deps.Tables]]
deps = ["DataAPI", "DataValueInterfaces", "IteratorInterfaceExtensions", "LinearAlgebra", "OrderedCollections", "TableTraits"]
git-tree-sha1 = "cb76cf677714c095e535e3501ac7954732aeea2d"
uuid = "bd369af6-aec1-5ad0-b16a-f7cc5008161c"
version = "1.11.1"

[[deps.Tar]]
deps = ["ArgTools", "SHA"]
uuid = "a4e569a6-e804-4fa4-b0f3-eef7a1d5b13e"
version = "1.10.0"

[[deps.Test]]
deps = ["InteractiveUtils", "Logging", "Random", "Serialization"]
uuid = "8dfed614-e22c-5e08-85e1-65c5234f0b40"

[[deps.TranscodingStreams]]
git-tree-sha1 = "3caa21522e7efac1ba21834a03734c57b4611c7e"
uuid = "3bb67fe8-82b1-5028-8e26-92a6c54297fa"
version = "0.10.4"
weakdeps = ["Random", "Test"]

    [deps.TranscodingStreams.extensions]
    TestExt = ["Test", "Random"]

[[deps.Tricks]]
git-tree-sha1 = "eae1bb484cd63b36999ee58be2de6c178105112f"
uuid = "410a4b4d-49e4-4fbc-ab6d-cb71b17b3775"
version = "0.1.8"

[[deps.URIs]]
git-tree-sha1 = "67db6cc7b3821e19ebe75791a9dd19c9b1188f2b"
uuid = "5c2747f8-b7ea-4ff2-ba2e-563bfd36b1d4"
version = "1.5.1"

[[deps.UUIDs]]
deps = ["Random", "SHA"]
uuid = "cf7118a7-6976-5b1a-9a39-7adc72f591a4"

[[deps.Unicode]]
uuid = "4ec0a83e-493e-50e2-b9ac-8f72acf5a8f5"

[[deps.Zlib_jll]]
deps = ["Libdl"]
uuid = "83775a58-1f1d-513f-b197-d71354ab007a"
version = "1.2.13+1"

[[deps.libblastrampoline_jll]]
deps = ["Artifacts", "Libdl"]
uuid = "8e850b90-86db-534c-a0d3-1478176c7d93"
version = "5.8.0+1"

[[deps.nghttp2_jll]]
deps = ["Artifacts", "Libdl"]
uuid = "8e850ede-7688-5339-a07c-302acd2aaf8d"
version = "1.52.0+1"

[[deps.p7zip_jll]]
deps = ["Artifacts", "Libdl"]
uuid = "3f19e933-33d8-53b3-aaab-bd5110c3b7a0"
version = "17.4.0+2"
"""

# ╔═╡ Cell order:
# ╟─f5450eab-0f9f-4b7f-9b80-992d3c553ba9
# ╟─731c88b4-7daf-480d-b163-7003a5fbd41f
# ╟─a5de5746-3df0-45b4-a62c-3daf36f015a5
# ╟─8bcc8106-31e8-4212-8f9e-8800e5737b11
# ╟─657e8ee4-5df9-42c1-8639-ba5ab37b51b4
# ╟─a3e50f79-9370-4068-8384-5841c3ba8f3d
# ╟─36e6512e-a077-48ad-8fe8-70a1bd1bed93
# ╟─982fa9ef-7fdf-4697-a39e-e48ac2ac7ae5
# ╟─ce1e6bc3-3e22-4163-9c1f-f91976954376
# ╟─dda3cea8-ff3c-45f3-93e9-207bf63f25aa
# ╟─dbffdff4-ffbd-4111-a0a3-8805e2e489ce
# ╟─02ae383b-c437-47c8-97c1-786130a43adb
# ╟─e1f618e8-9ad0-436e-b43c-9cbd8e6b5f60
# ╟─354d2f11-01c8-4d2e-ba6d-c18853018ce7
# ╟─1591fc11-7174-46a8-95d0-0ff9e1ce2424
# ╟─d3cd8fc8-a3cc-4a42-a8e0-73c06752ddf3
# ╟─ef4da0da-1905-4c7e-bacc-3d782920100b
# ╟─bdfc509c-1288-45ff-8dd2-15f9f31511b8
# ╟─6afec959-4488-4a7e-99e9-186057053197
# ╟─9510d176-a1e0-44b0-a584-08855d257e40
# ╟─2163ac0a-301f-455d-bc07-8fa2873aa59f
# ╟─e1342341-a348-453c-894f-dfbe857eb4db
# ╟─c7d4ecf0-d78d-4666-a07f-380c3265c96a
# ╟─19c41dd1-0155-4aa1-88ba-2cb4c4e35595
# ╟─6ebbd3a5-5c68-494b-8c56-82d958d8bee8
# ╟─2ec3879c-2220-4ba5-aea9-6bf4ad6a5c29
# ╟─c8580960-58ca-4324-9593-57db48ccdc1e
# ╟─2c63c47c-307a-4844-8cf2-9c44982ac5cd
# ╟─0008a21c-49dc-4ee0-bc27-ca100e599278
# ╟─1bae6b88-9b8c-42a7-8abe-981a46714219
# ╟─b22ded79-21d4-460f-a5d0-7951957473af
# ╟─2ef23d43-033b-4e3d-842b-36f6d7f3f91c
# ╟─5a5cfed2-6017-4a05-9f3f-b93d0bdc81a2
# ╟─b01e826e-acc1-4684-a2d1-fdb53946cdf3
# ╟─e52b3706-8bc7-49aa-b154-0aca6560d8ac
# ╟─7fa2dc91-127d-43e9-a2ed-d7b36d27ce1e
# ╟─9dba51e3-0738-40a1-96d8-f5583cdc5729
# ╟─00000000-0000-0000-0000-000000000001
# ╟─00000000-0000-0000-0000-000000000002