### A Pluto.jl notebook ###
# v0.19.9

using Markdown
using InteractiveUtils

# ╔═╡ 41d7b190-2a14-11ec-2469-7977eac40f12
#add button to trigger presentation mode
html"<button onclick='present()'>present</button>"

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
	<p align=center style="font-size:25px; font-family:family:Georgia"> <b> Assignment 02</b> <p>
	<p align=center style="font-size:25px; font-family:family:Georgia"> <b> Bond Pricing Fundamentals </b> <p>
	<p style="padding-bottom:1cm"> </p>
	<p align=center style="font-size:25px; font-family:family:Georgia"> Spring 2023 <p>
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

# ╔═╡ 36e6512e-a077-48ad-8fe8-70a1bd1bed93
md"""
## Exercise 1
"""

# ╔═╡ 239caa07-cb32-4757-8fea-6f5054516137
Markdown.parse("
- Suppose you consider investing in a $(T_1)-year bond. This bond pays coupon cash flows of \$ $(C_11) in one year from now, \$ $(C_12) in two years from now, \$ $(C_13) in three years from now, and \$ $(C_14) in four years from now. Assume that interest rates are r = $(r_1*100) percent (annual rate, annually compounded). What is the price of this bond?
")

# ╔═╡ ce1e6bc3-3e22-4163-9c1f-f91976954376
# ╠═╡ show_logs = false
begin
 T_1 = 4
 C_11 = 200
 C_12 = 400
 C_13 = 600
 C_14 = 800
 r_1 = 0.06
 PV_1 = C_11/(1+r_1)^1 + C_12/(1+r_1)^2 + C_13/(1+r_1)^3 + C_14/(1+r_1)^4
 display("")
end

# ╔═╡ dbffdff4-ffbd-4111-a0a3-8805e2e489ce
Foldable("Solution", 
Markdown.parse("
**Solution**
	
``\$ \\textrm{PV} = \\frac{$(C_11)}{(1+$(r_1))^{1}} + \\frac{$(C_12)}{(1+$(r_1))^{2}} + \\frac{$(C_13)}{(1+$(r_1))^{3}} + \\frac{$(C_14)}{(1+$(r_1))^{4}} = $(roundmult(PV_1,1e-6))\$``.
"))

# ╔═╡ 02ae383b-c437-47c8-97c1-786130a43adb
vspace

# ╔═╡ 7ea060c9-731e-41da-a439-12610260fae8
md"""
## Exercise 2
"""

# ╔═╡ 2523f7ec-d65f-4145-9fb2-3436ce6744d5
Markdown.parse("
- Suppose you consider investing in a $(T_2)-year bond. This bond pays semi-annual coupon cash flows of \$ $(C_21) after six months, \$ $(C_22) in one year from now, \$ $(C_23) in 1.5 years from now, and \$ $(C_24) in two years years from now. Assume that interest rates are r = $(r_2*100) percent (annual rate, semi-annually compounded). What is the price of this bond?
")

# ╔═╡ 2adc33c7-5bf9-479a-9512-501e0e1649f6
# ╠═╡ show_logs = false
begin
 T_2 = 2
 C_21 = 200
 C_22 = 400
 C_23 = 600
 C_24 = 800
 r_2 = 0.06
 PV_2 = C_21/(1+(r_2/2))^(2*0.5) + C_22/(1+(r_2/2))^(2*1.0) + C_23/(1+(r_2/2))^(2*1.5) + C_24/(1+(r_2/2))^(2*2.0)
 display("")
end

# ╔═╡ 46f769ec-3b6a-4f56-9cc8-71f4a29dd2e2
Foldable("Solution",
Markdown.parse("
**Solution**

``\$ \\textrm{PV} = \\frac{$(C_21)}{(1+\\frac{$(r_2)}{2})^{2\\times 0.5}} + \\frac{$(C_22)}{(1+\\frac{$(r_2)}{2})^{2\\times 1.0}} + \\frac{$(C_23)}{(1+\\frac{$(r_2)}{2})^{2\\times 1.5}} + \\frac{$(C_24)}{(1+\\frac{$(r_2)}{2})^{2\\times 2.0}} = $(roundmult(PV_2,1e-6))\$``.
"))

# ╔═╡ 6bbb6e05-c6be-45ea-a84a-caa86e0cba17
vspace

# ╔═╡ 1702bd2f-cba9-4cb9-9fa3-2c0e99b81bbf
md"""
## Exercise 3
"""

# ╔═╡ 54ab8f43-70b0-47d2-9698-575071d32322
Markdown.parse("
Suppose you consider investing in a fixed-income security that pays you a total of \$ $(C_31) million split into equal cash flows over a $(T_3)-year period. What is the fair market price for this investment, assuming that interest rates are $(r_3*100) percent (per annum)?
")

# ╔═╡ c0858db4-7a7c-4f82-bdc4-575a220d694d
# ╠═╡ show_logs = false
begin
 T_3 = 30
 C_31 = 10# total cash flow
 C_32 = C_31/T_3
 r_3 = 0.05
 PV_3 = C_32/r_3*(1-1/(1+r_3)^T_3)
 display("")
end

# ╔═╡ adb410b2-b053-46af-95f8-7501dfb2213d
Foldable("Solution",
Markdown.parse("
**Solution**

``\$ \\textrm{PV} = \\frac{C}{r} \\times \\left( 1 - \\frac{1}{(1+r)^{T}} \\right) = \\frac{$(roundmult(C_32,1e-6)) \\textrm{ Million}}{$(r_3)} \\times \\left( 1 - \\frac{1}{(1+$(r_3))^{$(T_3)}} \\right) = $(roundmult(PV_3,1e-3)) \\textrm{ Million} \$``.
"))

# ╔═╡ f531b5e8-c3e4-465b-8232-141b2b4fb42e
vspace

# ╔═╡ 37b083ac-6448-4d91-9e74-d645fcb00504
md"""
## Exercise 4
"""

# ╔═╡ 9a39984d-ec6c-4a6f-a483-99f366afb289
Markdown.parse("
- Suppose you consider investing in a perpetual fixed-income security that has a cash flow of \$ $(C_4) in one year. The cash flows then grow at an annual rate of $(g_4*100) ``\\%`` per year forever. What would you be willing to pay for this security, assuming that interest rates are $(r_4*100) percent?")

# ╔═╡ 75aad9f7-fbee-43ce-be15-2a4da297e03f
# ╠═╡ show_logs = false
begin
 C_4 = 1000
 g_4 = 0.03
 r_4 = 0.05
 PV_4 = C_4/(r_4 - g_4)
 display("")
end

# ╔═╡ 92c2d933-98a8-4433-828c-3e83a397fed2
Foldable("Solution",
Markdown.parse("
**Solution**

``\$ \\textrm{PV} = \\frac{C}{r-g} = \\frac{$(C_4)}{$(r_4)-$(g_4)} = \$ $(roundmult(PV_4,1e-2))  \$``.
"))

# ╔═╡ dcd66a9e-9b36-4ea2-9f9e-f3b3b6e32c3a
vspace

# ╔═╡ 93802c3b-6ac6-4d60-8d33-863e335230f6
md"""
## Exercise 5
"""

# ╔═╡ 429bce00-f102-435f-b577-e3bc6378f284
Markdown.parse("
Suppose you consider investing in a fixed-income security that pays a cash flow of  \$ $(C_5) one year from today. Each year after that, the cash flows grow at a constant rate of $(roundmult(g_5*100,1e-2)) % percent per annum. The last cash flow is in $(T_5) years from today. What would you be willing to pay for this security, assuming that interest rates are $(r_5*100) %?
")

# ╔═╡ 1dd2ace5-98b6-473f-9d8e-fb0147355576
# ╠═╡ show_logs = false
begin
	C_5 = 97000
	T_5 = 10
	g_5 = 0.02
	r_5 = 0.03
	PV_5 = C_5/(r_5 - g_5) * (1-(1+g_5)^T_5/(1+r_5)^T_5)
	display("")
end

# ╔═╡ 6c6d75d2-ba91-40c0-8366-7db87fa51d34
Foldable("Solution",
Markdown.parse("
**Solution**

``\$ \\textrm{PV} = \\frac{C}{r-g} \\times \\left( 1- \\frac{(1+g)^T}{(1+r)^T} \\right) = \\frac{$(C_5)}{$(r_5)-$(g_5)} \\times \\left( 1- \\frac{(1+$(g_5))^{$(T_5)}}{(1+$(r_5))^{$(T_5)}} \\right) = \$ $(roundmult(PV_5,1e-2))  \$``.
"))

# ╔═╡ 1939b4e0-efd1-480b-a878-47c48903e9fa
vspace

# ╔═╡ 20d12d4e-d734-4475-b219-1f01f5f7d85f
md"""
## Exercise 6
"""

# ╔═╡ d5c29e93-4363-4c9d-9cd4-8386f547c99f
Markdown.parse("
Suppose you consider investing in a short-term fixed-income security that has a cash flow of \$ 200 in one month, \$ 400 in two months, and \$ 600 in three months. What would you be willing to pay for this security, assuming that interest rates are 6 %? Assume monthly compounding.
")

# ╔═╡ d402a211-2666-49c3-b9ec-d782e01c0cf1
# ╠═╡ show_logs = false
begin
	C_61 = 200
	C_62 = 400
	C_63 = 600
	r_6 = 0.06
	PV_6 = C_61/(1+r_6/12)^(12 * 1/12)+C_62/(1+r_6/12)^(12 * 2/12)+C_63/(1+r_6/12)^(12 * 3/12)
	display("")
end

# ╔═╡ 0a96974f-76f0-4879-b5fb-0bdd9aa2f10a
Foldable("Solution",
Markdown.parse("
**Solution**

First, we figure out at what times the cash flows come in.
The first is in one month. Hence, we set ``T=\\frac{1}{12}`` for the first cash flow.
The second is in two months. Hence, we set ``T=\\frac{2}{12}`` for the second cash flow.
The third is in three months. Hence, we set ``T=\\frac{3}{12}`` for the third cash flow.
We then calculate the present value of each cash flow using monthly compounding and take the sum.

``\$ \\textrm{PV} = \\frac{C_1}{(1+\\frac{r}{12})^{12\\times \\frac{1}{12}}} + \\frac{C_2}{(1+\\frac{r}{12})^{12\\times \\frac{2}{12}}} + \\frac{C_3}{(1+\\frac{r}{12})^{12\\times \\frac{3}{12}}}=\\frac{$(C_61)}{(1+\\frac{$(r_6)}{12})^{12\\times \\frac{1}{12}}} + \\frac{$(C_62)}{(1+\\frac{$(r_6)}{12})^{12\\times \\frac{2}{12}}} + \\frac{$(C_63)}{(1+\\frac{$(r_6)}{12})^{12\\times \\frac{3}{12}}}=\$ $(roundmult(PV_6,1e-2))  \$``.
"))

# ╔═╡ 7c80a921-2408-49cb-906f-a38652e00697
vspace

# ╔═╡ 036e1628-8606-4f9a-bda6-c2316d32e4fe
md"""
## Exercise 7
"""

# ╔═╡ 45e2bd20-aa69-4f80-a063-636bc4e59048
Markdown.parse("
Suppose you invested in a fixed income security. Assume that this security pays you a cash flow of  \$ $(C_71) now and it then pays monthly cash flows of $(C_72) per month for the next $(T_7) years. Your plan is to invest all cash flows into a money market savings account earning $(r_7*100) percent compounded monthly. How large is the balance in your money market account when you receive the last payment from the fixed income investment? 
")

# ╔═╡ 06896dd0-ab98-4f54-a949-043e2a097ae5
# ╠═╡ show_logs = false
begin
	T_7 = 10
	C_71 = 10000
	C_72 = 150
	r_7 = 0.05
	FV_71 = C_71 * (1+r_7/12)^(12*T_7)
	PV_71 = C_72/(r_7/12)*(1-1/(1+(r_7/12))^(12*T_7))
	FV_72 = PV_71 * (1+r_7/12)^(12*T_7)
	FV_7 = FV_71 + FV_72
	display("")
end

# ╔═╡ 3f62375c-2edf-4a39-b7d4-47e1f408ebae
Foldable("Solution",
Markdown.parse("
**Solution**

- Step 1: Calculate the future value of $(C_71) in $(T_7) years using monthly compounding.
- Step 2: Calculate the present value of the annuity in the amount of $(C_72) using monthly compounding.
- Step 3: Take the PV of the annuity computed in step 2 and calculate its future value in $(T_7) years. Note that this is analogous to Step 1.
- Step 4: Add the amounts in Step 1 and Step 4 to arrive at the final answer

**Step 1**:
``\$\\textrm{FV}_1 = C \\times \\left( 1+\\frac{r}{12} \\right)^{12\\times T} = $(C_71) \\times \\left( (1+\\frac{$(r_7)}{12} \\right)^{12\\times $(T_7)}  = $(roundmult(FV_71,1e-2))\$``

**Step 2**:
``\$ \\textrm{PV}_2 = \\frac{C}{\\frac{r}{12}} \\times \\left( 1 - \\frac{1}{(1+\\frac{r}{12})^{12\\times T}} \\right) =  \\frac{$(C_72)}{\\frac{$(r_7)}{12}} \\times \\left( 1 - \\frac{1}{(1+\\frac{$(r_7)}{12})^{12\\times $(T_7)}} \\right) = $(roundmult(PV_71,1e-2))\$``.

**Step 3**:
``\$\\textrm{FV}_2 = C \\times \\left( 1+\\frac{r}{12} \\right)^{12\\times T} = $(roundmult(PV_71,1e-2)) \\times \\left( 1+\\frac{$(r_7)}{12} \\right)^{12\\times $(T_7)}  = $(roundmult(FV_72,1e-2))\$``

**Step 4**:
``\$ FV = \\textrm{FV}_1 + \\textrm{FV}_2 = $(roundmult(FV_71,1e-2)) + $(roundmult(FV_72,1e-2)) = $(roundmult(FV_7,1e-2)) \$``

- Thus at the end of the $(T_7)-year period, your money market account has a total value of $(roundmult(FV_7,1e-2)).

"))

# ╔═╡ cdcf9417-4d7f-4e01-b304-64f9904e6de6
vspace

# ╔═╡ 871feffb-3729-4915-aca9-dd17d76035f8
md"""
## Exercise 8
"""

# ╔═╡ 77259410-e788-45e2-8e96-15c648f2965e
Markdown.parse("
Suppose you consider investing in a fixed-income security paying cash flows that grow
at a $(g_8*100) percent rate per year for $(T_82) years and then remain constant thereafter until the final payment in $(T_81) years. The cash flow at the end of the first year is $(C_81). Assume that interest rates are 5 percent. How much would you be willing to pay for this fixed-income security?

")

# ╔═╡ 2402fafe-5c80-4d2c-ba34-d5c7e1ff39e5
# ╠═╡ show_logs = false
begin
 T_81 = 30
 T_82 = 5
 r_8 = 0.05
 g_8 = 0.02
 C_81 = 1000	
 C_82 = C_81 * (1+g_8)^(T_82-1)	
 PV_81 = C_82/r_8*(1-1/(1+r_8)^(T_81-T_82))
 PV_82 = PV_81/(1+r_8)^T_82
 PV_83 = C_81/(r_8-g_8) * (1-((1+g_8)^T_82/(1+r_8)^T_82))	
 PV_84 = PV_82 + PV_83 
 display("")
end

# ╔═╡ b4a8045d-d9f4-4022-b8d4-b345e1aacb7c
Foldable("Solution",
Markdown.parse("
**Solution**

**Step 1:** 
Calculate the dollar amount  of the cash flows that start after $(T_82) years.
``\$ FV = C \\times (1+g)^{T-1} = $(C_81) \\times (1+$(g_8))^{$(T_82)-1} = $(roundmult(C_82,1e-2))\$``
Note: The first cash flow is $(C_81) and only after that this amount grows at the rate of $(g_8*100) percent for a total of $(T_82-1) times. Hence, we have the $(T_82-1) in the exponent.

**Step 2:** 
Calculate the present value of the stream of constant cash flows **in year $(T_82)**. Note that ths is a $(T_81-T_82) annuity.
``\$ \\textrm{PV}_5 = \\frac{C}{r} \\times \\left( 1 - \\frac{1}{(1+r)^{T}} \\right) = \\frac{$(roundmult(C_82,1e-2))}{$(r_8)} \\times \\left( 1 - \\frac{1}{(1+$(r_8))^{$(T_81)-$(T_82)}} \\right) = $(roundmult(PV_81,1e-2))\$``.

**Step 3:**
Since we computed the present value in year $(T_82) in Step 2. We need to discount it back to today.
``\$ PV = \\frac{PV_5}{(1+r)^T} = \\frac{$(roundmult(PV_81,1e-2))}{(1+$(r_8))^{$(T_82)}} = $(roundmult(PV_82,1e-2))\$``

**Step 4:**
Finally, we just need to calculate the present value of the cash flows from year 1 to year 5. We use the formula for a growing annuity to calculate this.
``\$ \\textrm{PV} = \\frac{C}{r-g} \\times \\left( 1 - \\frac{(1+g)^T}{(1+r)^{T}} \\right) = \\frac{$(C_81)}{$(r_8)-$(g_8)} \\times \\left( 1 - \\frac{(1+$(g_8))^{$(T_82)}}{(1+$(r_8))^{$(T_82)}} \\right) = $(roundmult(PV_83,1e-2))\$``

**Step 5:**
In the last step, we just add the result from Step 4 to the result from Step 3.
``\$ PV = $(roundmult(PV_82,1e-2)) + $(roundmult(PV_83,1e-2)) = $(roundmult(PV_84,1e-2))\$``

Thus, we would be willing to pay \$ $(roundmult(PV_84,1e-2)) for this fixed-income investment.
"))

# ╔═╡ e4a7a204-5657-4557-8800-7a246acae194
vspace

# ╔═╡ 2b3fffbf-e847-440a-8e8f-61a314e0d808
md"""
## Exercise 9
"""

# ╔═╡ 63b8c6ae-5f14-4e09-bcb4-9732b73e150c
Markdown.parse("
You are starting to plan for retirement and you consider investing in a fixed-income security that starts to pay annual cash flows of $(C_9) in $(T_92+1) years from today and has its last cash flow in $(T_91) years from today. What would you be willing to pay for this security, assuming that interest rates are $(r_9*100) percent.

")

# ╔═╡ 3ab55bd3-f60c-4e44-8340-b3a8c4ab5f8c
# ╠═╡ show_logs = false
begin
 T_91 = 45
 T_92 = 20
 r_9 = 0.05
 C_9 = 10000	
 PV_91 = C_9/r_9*(1-1/(1+r_8)^(T_91-T_92))
 PV_92 = PV_91/(1+r_9)^(T_92)
 display("")
end

# ╔═╡ af5034dc-81c7-4487-861a-6297fa4850d4
Foldable("Solution",
Markdown.parse("
**Solution**

**Step 1:** 

Calculate the present value of the stream of cash flows **in year $(T_92)**. Note that this is simply a $(T_91-T_92)-year annuity with the first cash flow in year $(T_92+1)
``\$ \\textrm{PV}_{$(T_92)} = \\frac{C}{r} \\times \\left( 1 - \\frac{1}{(1+r)^{T}} \\right) = \\frac{$(roundmult(C_9,1e-2))}{$(r_9)} \\times \\left( 1 - \\frac{1}{(1+$(r_9))^{$(T_91)-$(T_92)}} \\right) = $(roundmult(PV_91,1e-2))\$``.

**Step 2:**
Since we computed the present value in year $(T_92) in Step 1. We need to discount it back to today.
``\$ PV = \\frac{PV_{$(T_92)}}{(1+r)^T} = \\frac{$(roundmult(PV_91,1e-2))}{(1+$(r_9))^{$(T_92)}} = $(roundmult(PV_92,1e-2))\$``


Thus, we would be willing to pay \$ $(roundmult(PV_92,1e-2)) for this fixed-income investment.
"))

# ╔═╡ 2f75969e-c107-4184-b56c-6b8fca9e5634
vspace

# ╔═╡ c54bd48e-d7d1-4724-a7c8-099301e6c0bc
md"""
## Exercise 10
"""

# ╔═╡ 993d08fa-3f0e-4d1e-888e-32ddee9a0160
Markdown.parse("
You are starting to plan for retirement and you consider investing in a fixed-income security that starts to pay cash flows of $(C_10) $(m_10)-times per year in $(T_102+1) years from today and has its last cash flow in $(T_101) years from today. What would you be willing to pay for this security, assuming that interest rates are $(r_10*100) percent per annum.")

# ╔═╡ f28ff2cb-c3f9-4943-a65b-84fe3f2fabf1
# ╠═╡ show_logs = false
begin
 T_101 = 45
 T_102 = 20
 r_10 = 0.05
 C_10 = 10000	
 g_10 = 0.00
 m_10 = 2
 PV_101 = C_10/( (r_10/m_10)-(g_10/m_10)) * ( 1-1/(1+(r_10/m_10))^(m_10*(T_101-T_102)))
	
 PV_102 = PV_101/(1+(r_10/m_10))^(m_10*T_102)
 display("")
end

# ╔═╡ 7706691a-d4ef-4cca-b7a4-0119d10e9560
Foldable("Solution",
Markdown.parse("
**Solution**

**Step 1:** 

Calculate the present value of the stream of cash flows **in year $(T_102)**. Note that this is simply a $(T_101-T_102)-year annuity with the first cash flow in year $(T_102+1)
``\$ \\textrm{PV}_{$(T_102)} = \\frac{C}{\\frac{r}{m}} \\times \\left( 1 - \\frac{1}{(1+\\frac{r}{m})^{m\\times T}} \\right) = \\frac{$(roundmult(C_10,1e-2))}{\\frac{$(r_10)}{$(m_10)}} \\times \\left( 1 - \\frac{1}{\\left(1+\\frac{$(r_10)}{$(m_10)}\\right)^{$(m_10)\\times ($(T_101)-$(T_102))}} \\right) = $(roundmult(PV_101,1e-2))\$``.

**Step 2:**
Since we computed the present value in year $(T_102) in Step 1. We need to discount it back to today.
``\$ PV = \\frac{PV_{$(T_102)}}{\\left(1+\\frac{r}{m}\\right)^{m\\times T}} = \\frac{$(roundmult(PV_101,1e-2))}{\\left(1+\\frac{$(r_10)}{$(m_10)}\\right)^{$(m_10) \\times $(T_102)}} = $(roundmult(PV_102,1e-2))\$``


Thus, we would be willing to pay \$ $(roundmult(PV_102,1e-2)) for this fixed-income investment.
"))

# ╔═╡ 24972917-ba7d-4a8e-9704-19220693b021
vspace

# ╔═╡ 9dba51e3-0738-40a1-96d8-f5583cdc5729
# ╠═╡ show_logs = false
begin
	#using Pkg
	#Pkg.upgrade_manifest()
	#Pkg.resolve()
	
	using DataFrames, HTTP,  Dates, PlutoUI, Printf, LaTeXStrings, HypertextLiteral

	using Plots
	gr();
	Plots.GRBackend()


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
	display("")
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
Plots = "91a5bcdd-55d7-5caf-9e0b-520d859cae80"
PlutoUI = "7f904dfe-b85e-4ff6-b463-dae2292396a8"
Printf = "de0858da-6303-5e67-8744-51eddeeeb8d7"

[compat]
DataFrames = "~1.3.1"
HTTP = "~0.9.17"
HypertextLiteral = "~0.9.3"
LaTeXStrings = "~1.3.0"
Plots = "~1.25.3"
PlutoUI = "~0.7.27"
"""

# ╔═╡ 00000000-0000-0000-0000-000000000002
PLUTO_MANIFEST_TOML_CONTENTS = """
# This file is machine-generated - editing it directly is not advised

julia_version = "1.8.5"
manifest_format = "2.0"
project_hash = "76494c3c4a544c292f089e8500c87c723fd32478"

[[deps.AbstractPlutoDingetjes]]
deps = ["Pkg"]
git-tree-sha1 = "8eaf9f1b4921132a4cff3f36a1d9ba923b14a481"
uuid = "6e696c72-6542-2067-7265-42206c756150"
version = "1.1.4"

[[deps.Adapt]]
deps = ["LinearAlgebra"]
git-tree-sha1 = "195c5505521008abea5aee4f96930717958eac6f"
uuid = "79e6a3ab-5dfb-504d-930d-738a2a938a0e"
version = "3.4.0"

[[deps.ArgTools]]
uuid = "0dad84c5-d112-42e6-8d28-ef12dabb789f"
version = "1.1.1"

[[deps.Artifacts]]
uuid = "56f22d72-fd6d-98f1-02f0-08ddc0907c33"

[[deps.Base64]]
uuid = "2a0f44e3-6c83-55bd-87e4-b1978d98bd5f"

[[deps.Bzip2_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Pkg"]
git-tree-sha1 = "19a35467a82e236ff51bc17a3a44b69ef35185a2"
uuid = "6e34b625-4abd-537c-b88f-471c36dfa7a0"
version = "1.0.8+0"

[[deps.Cairo_jll]]
deps = ["Artifacts", "Bzip2_jll", "CompilerSupportLibraries_jll", "Fontconfig_jll", "FreeType2_jll", "Glib_jll", "JLLWrappers", "LZO_jll", "Libdl", "Pixman_jll", "Pkg", "Xorg_libXext_jll", "Xorg_libXrender_jll", "Zlib_jll", "libpng_jll"]
git-tree-sha1 = "4b859a208b2397a7a623a03449e4636bdb17bcf2"
uuid = "83423d85-b0ee-5818-9007-b63ccbeb887a"
version = "1.16.1+1"

[[deps.ChainRulesCore]]
deps = ["Compat", "LinearAlgebra", "SparseArrays"]
git-tree-sha1 = "e7ff6cadf743c098e08fca25c91103ee4303c9bb"
uuid = "d360d2e6-b24c-11e9-a2a3-2a2ae2dbcce4"
version = "1.15.6"

[[deps.ChangesOfVariables]]
deps = ["ChainRulesCore", "LinearAlgebra", "Test"]
git-tree-sha1 = "38f7a08f19d8810338d4f5085211c7dfa5d5bdd8"
uuid = "9e997f8a-9a97-42d5-a9f1-ce6bfc15e2c0"
version = "0.1.4"

[[deps.ColorSchemes]]
deps = ["ColorTypes", "ColorVectorSpace", "Colors", "FixedPointNumbers", "Random", "SnoopPrecompile"]
git-tree-sha1 = "aa3edc8f8dea6cbfa176ee12f7c2fc82f0608ed3"
uuid = "35d6a980-a343-548e-a6ea-1d62b119f2f4"
version = "3.20.0"

[[deps.ColorTypes]]
deps = ["FixedPointNumbers", "Random"]
git-tree-sha1 = "eb7f0f8307f71fac7c606984ea5fb2817275d6e4"
uuid = "3da002f7-5984-5a60-b8a6-cbb66c0b333f"
version = "0.11.4"

[[deps.ColorVectorSpace]]
deps = ["ColorTypes", "FixedPointNumbers", "LinearAlgebra", "SpecialFunctions", "Statistics", "TensorCore"]
git-tree-sha1 = "600cc5508d66b78aae350f7accdb58763ac18589"
uuid = "c3611d14-8923-5661-9e6a-0046d554d3a4"
version = "0.9.10"

[[deps.Colors]]
deps = ["ColorTypes", "FixedPointNumbers", "Reexport"]
git-tree-sha1 = "fc08e5930ee9a4e03f84bfb5211cb54e7769758a"
uuid = "5ae59095-9a9b-59fe-a467-6f913c188581"
version = "0.12.10"

[[deps.Compat]]
deps = ["Dates", "LinearAlgebra", "UUIDs"]
git-tree-sha1 = "00a2cccc7f098ff3b66806862d275ca3db9e6e5a"
uuid = "34da2185-b29b-5c13-b0c7-acf172513d20"
version = "4.5.0"

[[deps.CompilerSupportLibraries_jll]]
deps = ["Artifacts", "Libdl"]
uuid = "e66e0078-7015-5450-92f7-15fbd957f2ae"
version = "1.0.1+0"

[[deps.Contour]]
deps = ["StaticArrays"]
git-tree-sha1 = "9f02045d934dc030edad45944ea80dbd1f0ebea7"
uuid = "d38c429a-6771-53c6-b99e-75d170b6e991"
version = "0.5.7"

[[deps.Crayons]]
git-tree-sha1 = "249fe38abf76d48563e2f4556bebd215aa317e15"
uuid = "a8cc5b0e-0ffa-5ad4-8c14-923d3ee1735f"
version = "4.1.1"

[[deps.DataAPI]]
git-tree-sha1 = "e8119c1a33d267e16108be441a287a6981ba1630"
uuid = "9a962f9c-6df0-11e9-0e5d-c546b8b5ee8a"
version = "1.14.0"

[[deps.DataFrames]]
deps = ["Compat", "DataAPI", "Future", "InvertedIndices", "IteratorInterfaceExtensions", "LinearAlgebra", "Markdown", "Missings", "PooledArrays", "PrettyTables", "Printf", "REPL", "Reexport", "SortingAlgorithms", "Statistics", "TableTraits", "Tables", "Unicode"]
git-tree-sha1 = "db2a9cb664fcea7836da4b414c3278d71dd602d2"
uuid = "a93c6f00-e57d-5684-b7b6-d8193f3e46c0"
version = "1.3.6"

[[deps.DataStructures]]
deps = ["Compat", "InteractiveUtils", "OrderedCollections"]
git-tree-sha1 = "d1fff3a548102f48987a52a2e0d114fa97d730f0"
uuid = "864edb3b-99cc-5e75-8d2d-829cb0a9cfe8"
version = "0.18.13"

[[deps.DataValueInterfaces]]
git-tree-sha1 = "bfc1187b79289637fa0ef6d4436ebdfe6905cbd6"
uuid = "e2d170a0-9d28-54be-80f0-106bbe20a464"
version = "1.0.0"

[[deps.Dates]]
deps = ["Printf"]
uuid = "ade2ca70-3891-5945-98fb-dc099432e06a"

[[deps.DelimitedFiles]]
deps = ["Mmap"]
uuid = "8bb1440f-4735-579b-a4ab-409b98df4dab"

[[deps.DocStringExtensions]]
deps = ["LibGit2"]
git-tree-sha1 = "2fb1e02f2b635d0845df5d7c167fec4dd739b00d"
uuid = "ffbed154-4ef7-542d-bbb7-c09d3a79fcae"
version = "0.9.3"

[[deps.Downloads]]
deps = ["ArgTools", "FileWatching", "LibCURL", "NetworkOptions"]
uuid = "f43a241f-c20a-4ad4-852c-f6b1247861c6"
version = "1.6.0"

[[deps.EarCut_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Pkg"]
git-tree-sha1 = "e3290f2d49e661fbd94046d7e3726ffcb2d41053"
uuid = "5ae413db-bbd1-5e63-b57d-d24a61df00f5"
version = "2.2.4+0"

[[deps.Expat_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Pkg"]
git-tree-sha1 = "bad72f730e9e91c08d9427d5e8db95478a3c323d"
uuid = "2e619515-83b5-522b-bb60-26c02a35a201"
version = "2.4.8+0"

[[deps.Extents]]
git-tree-sha1 = "5e1e4c53fa39afe63a7d356e30452249365fba99"
uuid = "411431e0-e8b7-467b-b5e0-f676ba4f2910"
version = "0.1.1"

[[deps.FFMPEG]]
deps = ["FFMPEG_jll"]
git-tree-sha1 = "b57e3acbe22f8484b4b5ff66a7499717fe1a9cc8"
uuid = "c87230d0-a227-11e9-1b43-d7ebe4e7570a"
version = "0.4.1"

[[deps.FFMPEG_jll]]
deps = ["Artifacts", "Bzip2_jll", "FreeType2_jll", "FriBidi_jll", "JLLWrappers", "LAME_jll", "Libdl", "Ogg_jll", "OpenSSL_jll", "Opus_jll", "PCRE2_jll", "Pkg", "Zlib_jll", "libaom_jll", "libass_jll", "libfdk_aac_jll", "libvorbis_jll", "x264_jll", "x265_jll"]
git-tree-sha1 = "74faea50c1d007c85837327f6775bea60b5492dd"
uuid = "b22a6f82-2f65-5046-a5b2-351ab43fb4e5"
version = "4.4.2+2"

[[deps.FileWatching]]
uuid = "7b1f6079-737a-58dc-b8bc-7a2ca5c1b5ee"

[[deps.FixedPointNumbers]]
deps = ["Statistics"]
git-tree-sha1 = "335bfdceacc84c5cdf16aadc768aa5ddfc5383cc"
uuid = "53c48c17-4a7d-5ca2-90c5-79b7896eea93"
version = "0.8.4"

[[deps.Fontconfig_jll]]
deps = ["Artifacts", "Bzip2_jll", "Expat_jll", "FreeType2_jll", "JLLWrappers", "Libdl", "Libuuid_jll", "Pkg", "Zlib_jll"]
git-tree-sha1 = "21efd19106a55620a188615da6d3d06cd7f6ee03"
uuid = "a3f928ae-7b40-5064-980b-68af3947d34b"
version = "2.13.93+0"

[[deps.Formatting]]
deps = ["Printf"]
git-tree-sha1 = "8339d61043228fdd3eb658d86c926cb282ae72a8"
uuid = "59287772-0a20-5a39-b81b-1366585eb4c0"
version = "0.4.2"

[[deps.FreeType2_jll]]
deps = ["Artifacts", "Bzip2_jll", "JLLWrappers", "Libdl", "Pkg", "Zlib_jll"]
git-tree-sha1 = "87eb71354d8ec1a96d4a7636bd57a7347dde3ef9"
uuid = "d7e528f0-a631-5988-bf34-fe36492bcfd7"
version = "2.10.4+0"

[[deps.FriBidi_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Pkg"]
git-tree-sha1 = "aa31987c2ba8704e23c6c8ba8a4f769d5d7e4f91"
uuid = "559328eb-81f9-559d-9380-de523a88c83c"
version = "1.0.10+0"

[[deps.Future]]
deps = ["Random"]
uuid = "9fa8497b-333b-5362-9e8d-4d0656e87820"

[[deps.GLFW_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Libglvnd_jll", "Pkg", "Xorg_libXcursor_jll", "Xorg_libXi_jll", "Xorg_libXinerama_jll", "Xorg_libXrandr_jll"]
git-tree-sha1 = "d972031d28c8c8d9d7b41a536ad7bb0c2579caca"
uuid = "0656b61e-2033-5cc2-a64a-77c0f6c09b89"
version = "3.3.8+0"

[[deps.GPUArraysCore]]
deps = ["Adapt"]
git-tree-sha1 = "6872f5ec8fd1a38880f027a26739d42dcda6691f"
uuid = "46192b85-c4d5-4398-a991-12ede77f4527"
version = "0.1.2"

[[deps.GR]]
deps = ["Base64", "DelimitedFiles", "GR_jll", "HTTP", "JSON", "Libdl", "LinearAlgebra", "Pkg", "Printf", "Random", "RelocatableFolders", "Serialization", "Sockets", "Test", "UUIDs"]
git-tree-sha1 = "c98aea696662d09e215ef7cda5296024a9646c75"
uuid = "28b8d3ca-fb5f-59d9-8090-bfdbd6d07a71"
version = "0.64.4"

[[deps.GR_jll]]
deps = ["Artifacts", "Bzip2_jll", "Cairo_jll", "FFMPEG_jll", "Fontconfig_jll", "GLFW_jll", "JLLWrappers", "JpegTurbo_jll", "Libdl", "Libtiff_jll", "Pixman_jll", "Pkg", "Qt5Base_jll", "Zlib_jll", "libpng_jll"]
git-tree-sha1 = "bc9f7725571ddb4ab2c4bc74fa397c1c5ad08943"
uuid = "d2c73de3-f751-5644-a686-071e5b155ba9"
version = "0.69.1+0"

[[deps.GeoInterface]]
deps = ["Extents"]
git-tree-sha1 = "fb28b5dc239d0174d7297310ef7b84a11804dfab"
uuid = "cf35fbd7-0cd7-5166-be24-54bfbe79505f"
version = "1.0.1"

[[deps.GeometryBasics]]
deps = ["EarCut_jll", "GeoInterface", "IterTools", "LinearAlgebra", "StaticArrays", "StructArrays", "Tables"]
git-tree-sha1 = "fe9aea4ed3ec6afdfbeb5a4f39a2208909b162a6"
uuid = "5c1252a2-5f33-56bf-86c9-59e7332b4326"
version = "0.4.5"

[[deps.Gettext_jll]]
deps = ["Artifacts", "CompilerSupportLibraries_jll", "JLLWrappers", "Libdl", "Libiconv_jll", "Pkg", "XML2_jll"]
git-tree-sha1 = "9b02998aba7bf074d14de89f9d37ca24a1a0b046"
uuid = "78b55507-aeef-58d4-861c-77aaff3498b1"
version = "0.21.0+0"

[[deps.Glib_jll]]
deps = ["Artifacts", "Gettext_jll", "JLLWrappers", "Libdl", "Libffi_jll", "Libiconv_jll", "Libmount_jll", "PCRE2_jll", "Pkg", "Zlib_jll"]
git-tree-sha1 = "d3b3624125c1474292d0d8ed0f65554ac37ddb23"
uuid = "7746bdde-850d-59dc-9ae8-88ece973131d"
version = "2.74.0+2"

[[deps.Graphite2_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Pkg"]
git-tree-sha1 = "344bf40dcab1073aca04aa0df4fb092f920e4011"
uuid = "3b182d85-2403-5c21-9c21-1e1f0cc25472"
version = "1.3.14+0"

[[deps.Grisu]]
git-tree-sha1 = "53bb909d1151e57e2484c3d1b53e19552b887fb2"
uuid = "42e2da0e-8278-4e71-bc24-59509adca0fe"
version = "1.0.2"

[[deps.HTTP]]
deps = ["Base64", "Dates", "IniFile", "Logging", "MbedTLS", "NetworkOptions", "Sockets", "URIs"]
git-tree-sha1 = "0fa77022fe4b511826b39c894c90daf5fce3334a"
uuid = "cd3eb016-35fb-5094-929b-558a96fad6f3"
version = "0.9.17"

[[deps.HarfBuzz_jll]]
deps = ["Artifacts", "Cairo_jll", "Fontconfig_jll", "FreeType2_jll", "Glib_jll", "Graphite2_jll", "JLLWrappers", "Libdl", "Libffi_jll", "Pkg"]
git-tree-sha1 = "129acf094d168394e80ee1dc4bc06ec835e510a3"
uuid = "2e76f6c2-a576-52d4-95c1-20adfe4de566"
version = "2.8.1+1"

[[deps.Hyperscript]]
deps = ["Test"]
git-tree-sha1 = "8d511d5b81240fc8e6802386302675bdf47737b9"
uuid = "47d2ed2b-36de-50cf-bf87-49c2cf4b8b91"
version = "0.0.4"

[[deps.HypertextLiteral]]
deps = ["Tricks"]
git-tree-sha1 = "c47c5fa4c5308f27ccaac35504858d8914e102f9"
uuid = "ac1192a8-f4b3-4bfe-ba22-af5b92cd3ab2"
version = "0.9.4"

[[deps.IOCapture]]
deps = ["Logging", "Random"]
git-tree-sha1 = "f7be53659ab06ddc986428d3a9dcc95f6fa6705a"
uuid = "b5f81e59-6552-4d32-b1f0-c071b021bf89"
version = "0.2.2"

[[deps.IniFile]]
git-tree-sha1 = "f550e6e32074c939295eb5ea6de31849ac2c9625"
uuid = "83e8ac13-25f8-5344-8a64-a9f2b223428f"
version = "0.5.1"

[[deps.InteractiveUtils]]
deps = ["Markdown"]
uuid = "b77e0a4c-d291-57a0-90e8-8db25a27a240"

[[deps.InverseFunctions]]
deps = ["Test"]
git-tree-sha1 = "49510dfcb407e572524ba94aeae2fced1f3feb0f"
uuid = "3587e190-3f89-42d0-90ee-14403ec27112"
version = "0.1.8"

[[deps.InvertedIndices]]
git-tree-sha1 = "82aec7a3dd64f4d9584659dc0b62ef7db2ef3e19"
uuid = "41ab1584-1d38-5bbf-9106-f11c6c58b48f"
version = "1.2.0"

[[deps.IrrationalConstants]]
git-tree-sha1 = "7fd44fd4ff43fc60815f8e764c0f352b83c49151"
uuid = "92d709cd-6900-40b7-9082-c6be49f344b6"
version = "0.1.1"

[[deps.IterTools]]
git-tree-sha1 = "fa6287a4469f5e048d763df38279ee729fbd44e5"
uuid = "c8e1da08-722c-5040-9ed9-7db0dc04731e"
version = "1.4.0"

[[deps.IteratorInterfaceExtensions]]
git-tree-sha1 = "a3f24677c21f5bbe9d2a714f95dcd58337fb2856"
uuid = "82899510-4779-5014-852e-03e436cf321d"
version = "1.0.0"

[[deps.JLLWrappers]]
deps = ["Preferences"]
git-tree-sha1 = "abc9885a7ca2052a736a600f7fa66209f96506e1"
uuid = "692b3bcd-3c85-4b1f-b108-f13ce0eb3210"
version = "1.4.1"

[[deps.JSON]]
deps = ["Dates", "Mmap", "Parsers", "Unicode"]
git-tree-sha1 = "3c837543ddb02250ef42f4738347454f95079d4e"
uuid = "682c06a0-de6a-54ab-a142-c8b1cf79cde6"
version = "0.21.3"

[[deps.JpegTurbo_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Pkg"]
git-tree-sha1 = "b53380851c6e6664204efb2e62cd24fa5c47e4ba"
uuid = "aacddb02-875f-59d6-b918-886e6ef4fbf8"
version = "2.1.2+0"

[[deps.LAME_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Pkg"]
git-tree-sha1 = "f6250b16881adf048549549fba48b1161acdac8c"
uuid = "c1c5ebd0-6772-5130-a774-d5fcae4a789d"
version = "3.100.1+0"

[[deps.LERC_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Pkg"]
git-tree-sha1 = "bf36f528eec6634efc60d7ec062008f171071434"
uuid = "88015f11-f218-50d7-93a8-a6af411a945d"
version = "3.0.0+1"

[[deps.LZO_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Pkg"]
git-tree-sha1 = "e5b909bcf985c5e2605737d2ce278ed791b89be6"
uuid = "dd4b983a-f0e5-5f8d-a1b7-129d4a5fb1ac"
version = "2.10.1+0"

[[deps.LaTeXStrings]]
git-tree-sha1 = "f2355693d6778a178ade15952b7ac47a4ff97996"
uuid = "b964fa9f-0449-5b57-a5c2-d3ea65f4040f"
version = "1.3.0"

[[deps.Latexify]]
deps = ["Formatting", "InteractiveUtils", "LaTeXStrings", "MacroTools", "Markdown", "OrderedCollections", "Printf", "Requires"]
git-tree-sha1 = "2422f47b34d4b127720a18f86fa7b1aa2e141f29"
uuid = "23fbe1c1-3f47-55db-b15f-69d7ec21a316"
version = "0.15.18"

[[deps.LibCURL]]
deps = ["LibCURL_jll", "MozillaCACerts_jll"]
uuid = "b27032c2-a3e7-50c8-80cd-2d36dbcbfd21"
version = "0.6.3"

[[deps.LibCURL_jll]]
deps = ["Artifacts", "LibSSH2_jll", "Libdl", "MbedTLS_jll", "Zlib_jll", "nghttp2_jll"]
uuid = "deac9b47-8bc7-5906-a0fe-35ac56dc84c0"
version = "7.84.0+0"

[[deps.LibGit2]]
deps = ["Base64", "NetworkOptions", "Printf", "SHA"]
uuid = "76f85450-5226-5b5a-8eaa-529ad045b433"

[[deps.LibSSH2_jll]]
deps = ["Artifacts", "Libdl", "MbedTLS_jll"]
uuid = "29816b5a-b9ab-546f-933c-edad1886dfa8"
version = "1.10.2+0"

[[deps.Libdl]]
uuid = "8f399da3-3557-5675-b5ff-fb832c97cbdb"

[[deps.Libffi_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Pkg"]
git-tree-sha1 = "0b4a5d71f3e5200a7dff793393e09dfc2d874290"
uuid = "e9f186c6-92d2-5b65-8a66-fee21dc1b490"
version = "3.2.2+1"

[[deps.Libgcrypt_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Libgpg_error_jll", "Pkg"]
git-tree-sha1 = "64613c82a59c120435c067c2b809fc61cf5166ae"
uuid = "d4300ac3-e22c-5743-9152-c294e39db1e4"
version = "1.8.7+0"

[[deps.Libglvnd_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Pkg", "Xorg_libX11_jll", "Xorg_libXext_jll"]
git-tree-sha1 = "6f73d1dd803986947b2c750138528a999a6c7733"
uuid = "7e76a0d4-f3c7-5321-8279-8d96eeed0f29"
version = "1.6.0+0"

[[deps.Libgpg_error_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Pkg"]
git-tree-sha1 = "c333716e46366857753e273ce6a69ee0945a6db9"
uuid = "7add5ba3-2f88-524e-9cd5-f83b8a55f7b8"
version = "1.42.0+0"

[[deps.Libiconv_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Pkg"]
git-tree-sha1 = "c7cb1f5d892775ba13767a87c7ada0b980ea0a71"
uuid = "94ce4f54-9a6c-5748-9c1c-f9c7231a4531"
version = "1.16.1+2"

[[deps.Libmount_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Pkg"]
git-tree-sha1 = "9c30530bf0effd46e15e0fdcf2b8636e78cbbd73"
uuid = "4b2f31a3-9ecc-558c-b454-b3730dcb73e9"
version = "2.35.0+0"

[[deps.Libtiff_jll]]
deps = ["Artifacts", "JLLWrappers", "JpegTurbo_jll", "LERC_jll", "Libdl", "Pkg", "Zlib_jll", "Zstd_jll"]
git-tree-sha1 = "3eb79b0ca5764d4799c06699573fd8f533259713"
uuid = "89763e89-9b03-5906-acba-b20f662cd828"
version = "4.4.0+0"

[[deps.Libuuid_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Pkg"]
git-tree-sha1 = "7f3efec06033682db852f8b3bc3c1d2b0a0ab066"
uuid = "38a345b3-de98-5d2b-a5d3-14cd9215e700"
version = "2.36.0+0"

[[deps.LinearAlgebra]]
deps = ["Libdl", "libblastrampoline_jll"]
uuid = "37e2e46d-f89d-539d-b4ee-838fcccc9c8e"

[[deps.LogExpFunctions]]
deps = ["ChainRulesCore", "ChangesOfVariables", "DocStringExtensions", "InverseFunctions", "IrrationalConstants", "LinearAlgebra"]
git-tree-sha1 = "946607f84feb96220f480e0422d3484c49c00239"
uuid = "2ab3a3ac-af41-5b50-aa03-7779005ae688"
version = "0.3.19"

[[deps.Logging]]
uuid = "56ddb016-857b-54e1-b83d-db4d58db5568"

[[deps.MIMEs]]
git-tree-sha1 = "65f28ad4b594aebe22157d6fac869786a255b7eb"
uuid = "6c6e2e6c-3030-632d-7369-2d6c69616d65"
version = "0.1.4"

[[deps.MacroTools]]
deps = ["Markdown", "Random"]
git-tree-sha1 = "42324d08725e200c23d4dfb549e0d5d89dede2d2"
uuid = "1914dd2f-81c6-5fcd-8719-6d5c9610ff09"
version = "0.5.10"

[[deps.Markdown]]
deps = ["Base64"]
uuid = "d6f4376e-aef5-505a-96c1-9c027394607a"

[[deps.MbedTLS]]
deps = ["Dates", "MbedTLS_jll", "MozillaCACerts_jll", "Random", "Sockets"]
git-tree-sha1 = "03a9b9718f5682ecb107ac9f7308991db4ce395b"
uuid = "739be429-bea8-5141-9913-cc70e7f3736d"
version = "1.1.7"

[[deps.MbedTLS_jll]]
deps = ["Artifacts", "Libdl"]
uuid = "c8ffd9c3-330d-5841-b78e-0817d7145fa1"
version = "2.28.0+0"

[[deps.Measures]]
git-tree-sha1 = "c13304c81eec1ed3af7fc20e75fb6b26092a1102"
uuid = "442fdcdd-2543-5da2-b0f3-8c86c306513e"
version = "0.3.2"

[[deps.Missings]]
deps = ["DataAPI"]
git-tree-sha1 = "f66bdc5de519e8f8ae43bdc598782d35a25b1272"
uuid = "e1d29d7a-bbdc-5cf2-9ac0-f12de2c33e28"
version = "1.1.0"

[[deps.Mmap]]
uuid = "a63ad114-7e13-5084-954f-fe012c677804"

[[deps.MozillaCACerts_jll]]
uuid = "14a3606d-f60d-562e-9121-12d972cd8159"
version = "2022.2.1"

[[deps.NaNMath]]
deps = ["OpenLibm_jll"]
git-tree-sha1 = "a7c3d1da1189a1c2fe843a3bfa04d18d20eb3211"
uuid = "77ba4419-2d1f-58cd-9bb1-8ffee604a2e3"
version = "1.0.1"

[[deps.NetworkOptions]]
uuid = "ca575930-c2e3-43a9-ace4-1e988b2c1908"
version = "1.2.0"

[[deps.Ogg_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Pkg"]
git-tree-sha1 = "887579a3eb005446d514ab7aeac5d1d027658b8f"
uuid = "e7412a2a-1a6e-54c0-be00-318e2571c051"
version = "1.3.5+1"

[[deps.OpenBLAS_jll]]
deps = ["Artifacts", "CompilerSupportLibraries_jll", "Libdl"]
uuid = "4536629a-c528-5b80-bd46-f80d51c5b363"
version = "0.3.20+0"

[[deps.OpenLibm_jll]]
deps = ["Artifacts", "Libdl"]
uuid = "05823500-19ac-5b8b-9628-191a04bc5112"
version = "0.8.1+0"

[[deps.OpenSSL_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Pkg"]
git-tree-sha1 = "f6e9dba33f9f2c44e08a020b0caf6903be540004"
uuid = "458c3c95-2e84-50aa-8efc-19380b2a3a95"
version = "1.1.19+0"

[[deps.OpenSpecFun_jll]]
deps = ["Artifacts", "CompilerSupportLibraries_jll", "JLLWrappers", "Libdl", "Pkg"]
git-tree-sha1 = "13652491f6856acfd2db29360e1bbcd4565d04f1"
uuid = "efe28fd5-8261-553b-a9e1-b2916fc3738e"
version = "0.5.5+0"

[[deps.Opus_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Pkg"]
git-tree-sha1 = "51a08fb14ec28da2ec7a927c4337e4332c2a4720"
uuid = "91d4177d-7536-5919-b921-800302f37372"
version = "1.3.2+0"

[[deps.OrderedCollections]]
git-tree-sha1 = "85f8e6578bf1f9ee0d11e7bb1b1456435479d47c"
uuid = "bac558e1-5e72-5ebc-8fee-abe8a469f55d"
version = "1.4.1"

[[deps.PCRE2_jll]]
deps = ["Artifacts", "Libdl"]
uuid = "efcefdf7-47ab-520b-bdef-62a2eaa19f15"
version = "10.40.0+0"

[[deps.Parsers]]
deps = ["Dates", "SnoopPrecompile"]
git-tree-sha1 = "6466e524967496866901a78fca3f2e9ea445a559"
uuid = "69de0a69-1ddd-5017-9359-2bf0b02dc9f0"
version = "2.5.2"

[[deps.Pixman_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Pkg"]
git-tree-sha1 = "b4f5d02549a10e20780a24fce72bea96b6329e29"
uuid = "30392449-352a-5448-841d-b1acce4e97dc"
version = "0.40.1+0"

[[deps.Pkg]]
deps = ["Artifacts", "Dates", "Downloads", "LibGit2", "Libdl", "Logging", "Markdown", "Printf", "REPL", "Random", "SHA", "Serialization", "TOML", "Tar", "UUIDs", "p7zip_jll"]
uuid = "44cfe95a-1eb2-52ea-b672-e2afdf69b78f"
version = "1.8.0"

[[deps.PlotThemes]]
deps = ["PlotUtils", "Requires", "Statistics"]
git-tree-sha1 = "a3a964ce9dc7898193536002a6dd892b1b5a6f1d"
uuid = "ccf2f8ad-2431-5c83-bf29-c5338b663b6a"
version = "2.0.1"

[[deps.PlotUtils]]
deps = ["ColorSchemes", "Colors", "Dates", "Printf", "Random", "Reexport", "SnoopPrecompile", "Statistics"]
git-tree-sha1 = "5b7690dd212e026bbab1860016a6601cb077ab66"
uuid = "995b91a9-d308-5afd-9ec6-746e21dbc043"
version = "1.3.2"

[[deps.Plots]]
deps = ["Base64", "Contour", "Dates", "Downloads", "FFMPEG", "FixedPointNumbers", "GR", "GeometryBasics", "JSON", "Latexify", "LinearAlgebra", "Measures", "NaNMath", "PlotThemes", "PlotUtils", "Printf", "REPL", "Random", "RecipesBase", "RecipesPipeline", "Reexport", "Requires", "Scratch", "Showoff", "SparseArrays", "Statistics", "StatsBase", "UUIDs", "UnicodeFun", "Unzip"]
git-tree-sha1 = "d16070abde61120e01b4f30f6f398496582301d6"
uuid = "91a5bcdd-55d7-5caf-9e0b-520d859cae80"
version = "1.25.12"

[[deps.PlutoUI]]
deps = ["AbstractPlutoDingetjes", "Base64", "ColorTypes", "Dates", "FixedPointNumbers", "Hyperscript", "HypertextLiteral", "IOCapture", "InteractiveUtils", "JSON", "Logging", "MIMEs", "Markdown", "Random", "Reexport", "URIs", "UUIDs"]
git-tree-sha1 = "eadad7b14cf046de6eb41f13c9275e5aa2711ab6"
uuid = "7f904dfe-b85e-4ff6-b463-dae2292396a8"
version = "0.7.49"

[[deps.PooledArrays]]
deps = ["DataAPI", "Future"]
git-tree-sha1 = "a6062fe4063cdafe78f4a0a81cfffb89721b30e7"
uuid = "2dfb63ee-cc39-5dd5-95bd-886bf059d720"
version = "1.4.2"

[[deps.Preferences]]
deps = ["TOML"]
git-tree-sha1 = "47e5f437cc0e7ef2ce8406ce1e7e24d44915f88d"
uuid = "21216c6a-2e73-6563-6e65-726566657250"
version = "1.3.0"

[[deps.PrettyTables]]
deps = ["Crayons", "Formatting", "Markdown", "Reexport", "Tables"]
git-tree-sha1 = "dfb54c4e414caa595a1f2ed759b160f5a3ddcba5"
uuid = "08abe8d2-0d0c-5749-adfa-8a2ac140af0d"
version = "1.3.1"

[[deps.Printf]]
deps = ["Unicode"]
uuid = "de0858da-6303-5e67-8744-51eddeeeb8d7"

[[deps.Qt5Base_jll]]
deps = ["Artifacts", "CompilerSupportLibraries_jll", "Fontconfig_jll", "Glib_jll", "JLLWrappers", "Libdl", "Libglvnd_jll", "OpenSSL_jll", "Pkg", "Xorg_libXext_jll", "Xorg_libxcb_jll", "Xorg_xcb_util_image_jll", "Xorg_xcb_util_keysyms_jll", "Xorg_xcb_util_renderutil_jll", "Xorg_xcb_util_wm_jll", "Zlib_jll", "xkbcommon_jll"]
git-tree-sha1 = "0c03844e2231e12fda4d0086fd7cbe4098ee8dc5"
uuid = "ea2cea3b-5b76-57ae-a6ef-0a8af62496e1"
version = "5.15.3+2"

[[deps.REPL]]
deps = ["InteractiveUtils", "Markdown", "Sockets", "Unicode"]
uuid = "3fa0cd96-eef1-5676-8a61-b3b8758bbffb"

[[deps.Random]]
deps = ["SHA", "Serialization"]
uuid = "9a3f8284-a2c9-5f02-9a11-845980a1fd5c"

[[deps.RecipesBase]]
deps = ["SnoopPrecompile"]
git-tree-sha1 = "261dddd3b862bd2c940cf6ca4d1c8fe593e457c8"
uuid = "3cdcf5f2-1ef4-517c-9805-6587b60abb01"
version = "1.3.3"

[[deps.RecipesPipeline]]
deps = ["Dates", "NaNMath", "PlotUtils", "RecipesBase"]
git-tree-sha1 = "dc1e451e15d90347a7decc4221842a022b011714"
uuid = "01d81517-befc-4cb6-b9ec-a95719d0359c"
version = "0.5.2"

[[deps.Reexport]]
git-tree-sha1 = "45e428421666073eab6f2da5c9d310d99bb12f9b"
uuid = "189a3867-3050-52da-a836-e630ba90ab69"
version = "1.2.2"

[[deps.RelocatableFolders]]
deps = ["SHA", "Scratch"]
git-tree-sha1 = "cdbd3b1338c72ce29d9584fdbe9e9b70eeb5adca"
uuid = "05181044-ff0b-4ac5-8273-598c1e38db00"
version = "0.1.3"

[[deps.Requires]]
deps = ["UUIDs"]
git-tree-sha1 = "838a3a4188e2ded87a4f9f184b4b0d78a1e91cb7"
uuid = "ae029012-a4dd-5104-9daa-d747884805df"
version = "1.3.0"

[[deps.SHA]]
uuid = "ea8e919c-243c-51af-8825-aaa63cd721ce"
version = "0.7.0"

[[deps.Scratch]]
deps = ["Dates"]
git-tree-sha1 = "f94f779c94e58bf9ea243e77a37e16d9de9126bd"
uuid = "6c6a2e73-6563-6170-7368-637461726353"
version = "1.1.1"

[[deps.Serialization]]
uuid = "9e88b42a-f829-5b0c-bbe9-9e923198166b"

[[deps.Showoff]]
deps = ["Dates", "Grisu"]
git-tree-sha1 = "91eddf657aca81df9ae6ceb20b959ae5653ad1de"
uuid = "992d4aef-0814-514b-bc4d-f2e9a6c4116f"
version = "1.0.3"

[[deps.SnoopPrecompile]]
git-tree-sha1 = "f604441450a3c0569830946e5b33b78c928e1a85"
uuid = "66db9d55-30c0-4569-8b51-7e840670fc0c"
version = "1.0.1"

[[deps.Sockets]]
uuid = "6462fe0b-24de-5631-8697-dd941f90decc"

[[deps.SortingAlgorithms]]
deps = ["DataStructures"]
git-tree-sha1 = "a4ada03f999bd01b3a25dcaa30b2d929fe537e00"
uuid = "a2af1166-a08f-5f64-846c-94a0d3cef48c"
version = "1.1.0"

[[deps.SparseArrays]]
deps = ["LinearAlgebra", "Random"]
uuid = "2f01184e-e22b-5df5-ae63-d93ebab69eaf"

[[deps.SpecialFunctions]]
deps = ["ChainRulesCore", "IrrationalConstants", "LogExpFunctions", "OpenLibm_jll", "OpenSpecFun_jll"]
git-tree-sha1 = "d75bda01f8c31ebb72df80a46c88b25d1c79c56d"
uuid = "276daf66-3868-5448-9aa4-cd146d93841b"
version = "2.1.7"

[[deps.StaticArrays]]
deps = ["LinearAlgebra", "Random", "StaticArraysCore", "Statistics"]
git-tree-sha1 = "6954a456979f23d05085727adb17c4551c19ecd1"
uuid = "90137ffa-7385-5640-81b9-e52037218182"
version = "1.5.12"

[[deps.StaticArraysCore]]
git-tree-sha1 = "6b7ba252635a5eff6a0b0664a41ee140a1c9e72a"
uuid = "1e83bf80-4336-4d27-bf5d-d5a4f845583c"
version = "1.4.0"

[[deps.Statistics]]
deps = ["LinearAlgebra", "SparseArrays"]
uuid = "10745b16-79ce-11e8-11f9-7d13ad32a3b2"

[[deps.StatsAPI]]
deps = ["LinearAlgebra"]
git-tree-sha1 = "f9af7f195fb13589dd2e2d57fdb401717d2eb1f6"
uuid = "82ae8749-77ed-4fe6-ae5f-f523153014b0"
version = "1.5.0"

[[deps.StatsBase]]
deps = ["DataAPI", "DataStructures", "LinearAlgebra", "LogExpFunctions", "Missings", "Printf", "Random", "SortingAlgorithms", "SparseArrays", "Statistics", "StatsAPI"]
git-tree-sha1 = "d1bf48bfcc554a3761a133fe3a9bb01488e06916"
uuid = "2913bbd2-ae8a-5f71-8c99-4fb6c76f3a91"
version = "0.33.21"

[[deps.StructArrays]]
deps = ["Adapt", "DataAPI", "GPUArraysCore", "StaticArraysCore", "Tables"]
git-tree-sha1 = "b03a3b745aa49b566f128977a7dd1be8711c5e71"
uuid = "09ab397b-f2b6-538f-b94a-2f83cf4a842a"
version = "0.6.14"

[[deps.TOML]]
deps = ["Dates"]
uuid = "fa267f1f-6049-4f14-aa54-33bafae1ed76"
version = "1.0.0"

[[deps.TableTraits]]
deps = ["IteratorInterfaceExtensions"]
git-tree-sha1 = "c06b2f539df1c6efa794486abfb6ed2022561a39"
uuid = "3783bdb8-4a98-5b6b-af9a-565f29a5fe9c"
version = "1.0.1"

[[deps.Tables]]
deps = ["DataAPI", "DataValueInterfaces", "IteratorInterfaceExtensions", "LinearAlgebra", "OrderedCollections", "TableTraits", "Test"]
git-tree-sha1 = "c79322d36826aa2f4fd8ecfa96ddb47b174ac78d"
uuid = "bd369af6-aec1-5ad0-b16a-f7cc5008161c"
version = "1.10.0"

[[deps.Tar]]
deps = ["ArgTools", "SHA"]
uuid = "a4e569a6-e804-4fa4-b0f3-eef7a1d5b13e"
version = "1.10.1"

[[deps.TensorCore]]
deps = ["LinearAlgebra"]
git-tree-sha1 = "1feb45f88d133a655e001435632f019a9a1bcdb6"
uuid = "62fd8b95-f654-4bbd-a8a5-9c27f68ccd50"
version = "0.1.1"

[[deps.Test]]
deps = ["InteractiveUtils", "Logging", "Random", "Serialization"]
uuid = "8dfed614-e22c-5e08-85e1-65c5234f0b40"

[[deps.Tricks]]
git-tree-sha1 = "6bac775f2d42a611cdfcd1fb217ee719630c4175"
uuid = "410a4b4d-49e4-4fbc-ab6d-cb71b17b3775"
version = "0.1.6"

[[deps.URIs]]
git-tree-sha1 = "ac00576f90d8a259f2c9d823e91d1de3fd44d348"
uuid = "5c2747f8-b7ea-4ff2-ba2e-563bfd36b1d4"
version = "1.4.1"

[[deps.UUIDs]]
deps = ["Random", "SHA"]
uuid = "cf7118a7-6976-5b1a-9a39-7adc72f591a4"

[[deps.Unicode]]
uuid = "4ec0a83e-493e-50e2-b9ac-8f72acf5a8f5"

[[deps.UnicodeFun]]
deps = ["REPL"]
git-tree-sha1 = "53915e50200959667e78a92a418594b428dffddf"
uuid = "1cfade01-22cf-5700-b092-accc4b62d6e1"
version = "0.4.1"

[[deps.Unzip]]
git-tree-sha1 = "34db80951901073501137bdbc3d5a8e7bbd06670"
uuid = "41fe7b60-77ed-43a1-b4f0-825fd5a5650d"
version = "0.1.2"

[[deps.Wayland_jll]]
deps = ["Artifacts", "Expat_jll", "JLLWrappers", "Libdl", "Libffi_jll", "Pkg", "XML2_jll"]
git-tree-sha1 = "ed8d92d9774b077c53e1da50fd81a36af3744c1c"
uuid = "a2964d1f-97da-50d4-b82a-358c7fce9d89"
version = "1.21.0+0"

[[deps.Wayland_protocols_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Pkg"]
git-tree-sha1 = "4528479aa01ee1b3b4cd0e6faef0e04cf16466da"
uuid = "2381bf8a-dfd0-557d-9999-79630e7b1b91"
version = "1.25.0+0"

[[deps.XML2_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Libiconv_jll", "Pkg", "Zlib_jll"]
git-tree-sha1 = "93c41695bc1c08c46c5899f4fe06d6ead504bb73"
uuid = "02c8fc9c-b97f-50b9-bbe4-9be30ff0a78a"
version = "2.10.3+0"

[[deps.XSLT_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Libgcrypt_jll", "Libgpg_error_jll", "Libiconv_jll", "Pkg", "XML2_jll", "Zlib_jll"]
git-tree-sha1 = "91844873c4085240b95e795f692c4cec4d805f8a"
uuid = "aed1982a-8fda-507f-9586-7b0439959a61"
version = "1.1.34+0"

[[deps.Xorg_libX11_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Pkg", "Xorg_libxcb_jll", "Xorg_xtrans_jll"]
git-tree-sha1 = "5be649d550f3f4b95308bf0183b82e2582876527"
uuid = "4f6342f7-b3d2-589e-9d20-edeb45f2b2bc"
version = "1.6.9+4"

[[deps.Xorg_libXau_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Pkg"]
git-tree-sha1 = "4e490d5c960c314f33885790ed410ff3a94ce67e"
uuid = "0c0b7dd1-d40b-584c-a123-a41640f87eec"
version = "1.0.9+4"

[[deps.Xorg_libXcursor_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Pkg", "Xorg_libXfixes_jll", "Xorg_libXrender_jll"]
git-tree-sha1 = "12e0eb3bc634fa2080c1c37fccf56f7c22989afd"
uuid = "935fb764-8cf2-53bf-bb30-45bb1f8bf724"
version = "1.2.0+4"

[[deps.Xorg_libXdmcp_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Pkg"]
git-tree-sha1 = "4fe47bd2247248125c428978740e18a681372dd4"
uuid = "a3789734-cfe1-5b06-b2d0-1dd0d9d62d05"
version = "1.1.3+4"

[[deps.Xorg_libXext_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Pkg", "Xorg_libX11_jll"]
git-tree-sha1 = "b7c0aa8c376b31e4852b360222848637f481f8c3"
uuid = "1082639a-0dae-5f34-9b06-72781eeb8cb3"
version = "1.3.4+4"

[[deps.Xorg_libXfixes_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Pkg", "Xorg_libX11_jll"]
git-tree-sha1 = "0e0dc7431e7a0587559f9294aeec269471c991a4"
uuid = "d091e8ba-531a-589c-9de9-94069b037ed8"
version = "5.0.3+4"

[[deps.Xorg_libXi_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Pkg", "Xorg_libXext_jll", "Xorg_libXfixes_jll"]
git-tree-sha1 = "89b52bc2160aadc84d707093930ef0bffa641246"
uuid = "a51aa0fd-4e3c-5386-b890-e753decda492"
version = "1.7.10+4"

[[deps.Xorg_libXinerama_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Pkg", "Xorg_libXext_jll"]
git-tree-sha1 = "26be8b1c342929259317d8b9f7b53bf2bb73b123"
uuid = "d1454406-59df-5ea1-beac-c340f2130bc3"
version = "1.1.4+4"

[[deps.Xorg_libXrandr_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Pkg", "Xorg_libXext_jll", "Xorg_libXrender_jll"]
git-tree-sha1 = "34cea83cb726fb58f325887bf0612c6b3fb17631"
uuid = "ec84b674-ba8e-5d96-8ba1-2a689ba10484"
version = "1.5.2+4"

[[deps.Xorg_libXrender_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Pkg", "Xorg_libX11_jll"]
git-tree-sha1 = "19560f30fd49f4d4efbe7002a1037f8c43d43b96"
uuid = "ea2f1a96-1ddc-540d-b46f-429655e07cfa"
version = "0.9.10+4"

[[deps.Xorg_libpthread_stubs_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Pkg"]
git-tree-sha1 = "6783737e45d3c59a4a4c4091f5f88cdcf0908cbb"
uuid = "14d82f49-176c-5ed1-bb49-ad3f5cbd8c74"
version = "0.1.0+3"

[[deps.Xorg_libxcb_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Pkg", "XSLT_jll", "Xorg_libXau_jll", "Xorg_libXdmcp_jll", "Xorg_libpthread_stubs_jll"]
git-tree-sha1 = "daf17f441228e7a3833846cd048892861cff16d6"
uuid = "c7cfdc94-dc32-55de-ac96-5a1b8d977c5b"
version = "1.13.0+3"

[[deps.Xorg_libxkbfile_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Pkg", "Xorg_libX11_jll"]
git-tree-sha1 = "926af861744212db0eb001d9e40b5d16292080b2"
uuid = "cc61e674-0454-545c-8b26-ed2c68acab7a"
version = "1.1.0+4"

[[deps.Xorg_xcb_util_image_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Pkg", "Xorg_xcb_util_jll"]
git-tree-sha1 = "0fab0a40349ba1cba2c1da699243396ff8e94b97"
uuid = "12413925-8142-5f55-bb0e-6d7ca50bb09b"
version = "0.4.0+1"

[[deps.Xorg_xcb_util_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Pkg", "Xorg_libxcb_jll"]
git-tree-sha1 = "e7fd7b2881fa2eaa72717420894d3938177862d1"
uuid = "2def613f-5ad1-5310-b15b-b15d46f528f5"
version = "0.4.0+1"

[[deps.Xorg_xcb_util_keysyms_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Pkg", "Xorg_xcb_util_jll"]
git-tree-sha1 = "d1151e2c45a544f32441a567d1690e701ec89b00"
uuid = "975044d2-76e6-5fbe-bf08-97ce7c6574c7"
version = "0.4.0+1"

[[deps.Xorg_xcb_util_renderutil_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Pkg", "Xorg_xcb_util_jll"]
git-tree-sha1 = "dfd7a8f38d4613b6a575253b3174dd991ca6183e"
uuid = "0d47668e-0667-5a69-a72c-f761630bfb7e"
version = "0.3.9+1"

[[deps.Xorg_xcb_util_wm_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Pkg", "Xorg_xcb_util_jll"]
git-tree-sha1 = "e78d10aab01a4a154142c5006ed44fd9e8e31b67"
uuid = "c22f9ab0-d5fe-5066-847c-f4bb1cd4e361"
version = "0.4.1+1"

[[deps.Xorg_xkbcomp_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Pkg", "Xorg_libxkbfile_jll"]
git-tree-sha1 = "4bcbf660f6c2e714f87e960a171b119d06ee163b"
uuid = "35661453-b289-5fab-8a00-3d9160c6a3a4"
version = "1.4.2+4"

[[deps.Xorg_xkeyboard_config_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Pkg", "Xorg_xkbcomp_jll"]
git-tree-sha1 = "5c8424f8a67c3f2209646d4425f3d415fee5931d"
uuid = "33bec58e-1273-512f-9401-5d533626f822"
version = "2.27.0+4"

[[deps.Xorg_xtrans_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Pkg"]
git-tree-sha1 = "79c31e7844f6ecf779705fbc12146eb190b7d845"
uuid = "c5fb5394-a638-5e4d-96e5-b29de1b5cf10"
version = "1.4.0+3"

[[deps.Zlib_jll]]
deps = ["Libdl"]
uuid = "83775a58-1f1d-513f-b197-d71354ab007a"
version = "1.2.12+3"

[[deps.Zstd_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Pkg"]
git-tree-sha1 = "e45044cd873ded54b6a5bac0eb5c971392cf1927"
uuid = "3161d3a3-bdf6-5164-811a-617609db77b4"
version = "1.5.2+0"

[[deps.libaom_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Pkg"]
git-tree-sha1 = "3a2ea60308f0996d26f1e5354e10c24e9ef905d4"
uuid = "a4ae2306-e953-59d6-aa16-d00cac43593b"
version = "3.4.0+0"

[[deps.libass_jll]]
deps = ["Artifacts", "Bzip2_jll", "FreeType2_jll", "FriBidi_jll", "HarfBuzz_jll", "JLLWrappers", "Libdl", "Pkg", "Zlib_jll"]
git-tree-sha1 = "5982a94fcba20f02f42ace44b9894ee2b140fe47"
uuid = "0ac62f75-1d6f-5e53-bd7c-93b484bb37c0"
version = "0.15.1+0"

[[deps.libblastrampoline_jll]]
deps = ["Artifacts", "Libdl", "OpenBLAS_jll"]
uuid = "8e850b90-86db-534c-a0d3-1478176c7d93"
version = "5.1.1+0"

[[deps.libfdk_aac_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Pkg"]
git-tree-sha1 = "daacc84a041563f965be61859a36e17c4e4fcd55"
uuid = "f638f0a6-7fb0-5443-88ba-1cc74229b280"
version = "2.0.2+0"

[[deps.libpng_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Pkg", "Zlib_jll"]
git-tree-sha1 = "94d180a6d2b5e55e447e2d27a29ed04fe79eb30c"
uuid = "b53b4c65-9356-5827-b1ea-8c7a1a84506f"
version = "1.6.38+0"

[[deps.libvorbis_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Ogg_jll", "Pkg"]
git-tree-sha1 = "b910cb81ef3fe6e78bf6acee440bda86fd6ae00c"
uuid = "f27f6e37-5d2b-51aa-960f-b287f2bc3b7a"
version = "1.3.7+1"

[[deps.nghttp2_jll]]
deps = ["Artifacts", "Libdl"]
uuid = "8e850ede-7688-5339-a07c-302acd2aaf8d"
version = "1.48.0+0"

[[deps.p7zip_jll]]
deps = ["Artifacts", "Libdl"]
uuid = "3f19e933-33d8-53b3-aaab-bd5110c3b7a0"
version = "17.4.0+0"

[[deps.x264_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Pkg"]
git-tree-sha1 = "4fea590b89e6ec504593146bf8b988b2c00922b2"
uuid = "1270edf5-f2f9-52d2-97e9-ab00b5d0237a"
version = "2021.5.5+0"

[[deps.x265_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Pkg"]
git-tree-sha1 = "ee567a171cce03570d77ad3a43e90218e38937a9"
uuid = "dfaa095f-4041-5dcd-9319-2fabd8486b76"
version = "3.5.0+0"

[[deps.xkbcommon_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Pkg", "Wayland_jll", "Wayland_protocols_jll", "Xorg_libxcb_jll", "Xorg_xkeyboard_config_jll"]
git-tree-sha1 = "9ebfc140cc56e8c2156a15ceac2f0302e327ac0a"
uuid = "d8fb68d0-12a3-5cfd-a85a-d49703b185fd"
version = "1.4.1+0"
"""

# ╔═╡ Cell order:
# ╟─f5450eab-0f9f-4b7f-9b80-992d3c553ba9
# ╟─41d7b190-2a14-11ec-2469-7977eac40f12
# ╟─731c88b4-7daf-480d-b163-7003a5fbd41f
# ╟─a5de5746-3df0-45b4-a62c-3daf36f015a5
# ╟─8bcc8106-31e8-4212-8f9e-8800e5737b11
# ╟─36e6512e-a077-48ad-8fe8-70a1bd1bed93
# ╟─239caa07-cb32-4757-8fea-6f5054516137
# ╟─ce1e6bc3-3e22-4163-9c1f-f91976954376
# ╟─dbffdff4-ffbd-4111-a0a3-8805e2e489ce
# ╟─02ae383b-c437-47c8-97c1-786130a43adb
# ╟─7ea060c9-731e-41da-a439-12610260fae8
# ╟─2523f7ec-d65f-4145-9fb2-3436ce6744d5
# ╟─2adc33c7-5bf9-479a-9512-501e0e1649f6
# ╟─46f769ec-3b6a-4f56-9cc8-71f4a29dd2e2
# ╟─6bbb6e05-c6be-45ea-a84a-caa86e0cba17
# ╟─1702bd2f-cba9-4cb9-9fa3-2c0e99b81bbf
# ╟─54ab8f43-70b0-47d2-9698-575071d32322
# ╟─c0858db4-7a7c-4f82-bdc4-575a220d694d
# ╟─adb410b2-b053-46af-95f8-7501dfb2213d
# ╟─f531b5e8-c3e4-465b-8232-141b2b4fb42e
# ╟─37b083ac-6448-4d91-9e74-d645fcb00504
# ╟─9a39984d-ec6c-4a6f-a483-99f366afb289
# ╟─75aad9f7-fbee-43ce-be15-2a4da297e03f
# ╟─92c2d933-98a8-4433-828c-3e83a397fed2
# ╟─dcd66a9e-9b36-4ea2-9f9e-f3b3b6e32c3a
# ╟─93802c3b-6ac6-4d60-8d33-863e335230f6
# ╟─429bce00-f102-435f-b577-e3bc6378f284
# ╟─1dd2ace5-98b6-473f-9d8e-fb0147355576
# ╟─6c6d75d2-ba91-40c0-8366-7db87fa51d34
# ╟─1939b4e0-efd1-480b-a878-47c48903e9fa
# ╟─20d12d4e-d734-4475-b219-1f01f5f7d85f
# ╟─d5c29e93-4363-4c9d-9cd4-8386f547c99f
# ╟─d402a211-2666-49c3-b9ec-d782e01c0cf1
# ╟─0a96974f-76f0-4879-b5fb-0bdd9aa2f10a
# ╟─7c80a921-2408-49cb-906f-a38652e00697
# ╟─036e1628-8606-4f9a-bda6-c2316d32e4fe
# ╟─45e2bd20-aa69-4f80-a063-636bc4e59048
# ╟─06896dd0-ab98-4f54-a949-043e2a097ae5
# ╟─3f62375c-2edf-4a39-b7d4-47e1f408ebae
# ╟─cdcf9417-4d7f-4e01-b304-64f9904e6de6
# ╟─871feffb-3729-4915-aca9-dd17d76035f8
# ╟─77259410-e788-45e2-8e96-15c648f2965e
# ╟─2402fafe-5c80-4d2c-ba34-d5c7e1ff39e5
# ╟─b4a8045d-d9f4-4022-b8d4-b345e1aacb7c
# ╟─e4a7a204-5657-4557-8800-7a246acae194
# ╟─2b3fffbf-e847-440a-8e8f-61a314e0d808
# ╟─63b8c6ae-5f14-4e09-bcb4-9732b73e150c
# ╟─3ab55bd3-f60c-4e44-8340-b3a8c4ab5f8c
# ╟─af5034dc-81c7-4487-861a-6297fa4850d4
# ╟─2f75969e-c107-4184-b56c-6b8fca9e5634
# ╟─c54bd48e-d7d1-4724-a7c8-099301e6c0bc
# ╟─993d08fa-3f0e-4d1e-888e-32ddee9a0160
# ╟─f28ff2cb-c3f9-4943-a65b-84fe3f2fabf1
# ╟─7706691a-d4ef-4cca-b7a4-0119d10e9560
# ╟─24972917-ba7d-4a8e-9704-19220693b021
# ╟─9dba51e3-0738-40a1-96d8-f5583cdc5729
# ╟─00000000-0000-0000-0000-000000000001
# ╟─00000000-0000-0000-0000-000000000002
