# What is this thesis about?

## What is Meta-Analysis?
- Meta-analysis is a method of statistically calculating the true (real) effect of a relationship between variables.
- Individual experiments or research studies are usually limited because they may have small sample sizes. 
- This leaves the possibility of sampling error, essentially there is a possibility that the relationship found from the individual study maybe a statistical anomaly.
- Enter Meta-analysis, one way to determine what the real effect is, is by averaging the quantified relationship (i.e. correlation coefficient) from several studies

## But there is a caveat
- Meta-analysis only allows users to examine a single relationship at a time
- E.g. Advertising's effect on a company's sales

- However, in the real world we are often more interested in more than just a single relationship at a time
- Such as several variables effects on a single outcome variable
  - (E.g Effect of advertising, hiring more staff, and better training on a company's sales)

![image](https://user-images.githubusercontent.com/96096344/153248256-be301b20-5cbe-4153-8dca-3dc8ebf0faa4.png)

- Or several variables effects on multiple outcome variables
  - E.g Effect of advertising, hiring more staff, and better training on a company's sales at multiple locations

![image](https://user-images.githubusercontent.com/96096344/153248283-a4914dc9-93c6-4f12-9e72-ed783c6feb8d.png)

## Enter Meta-analytic Structural Equation Modelling (MASEM)
- It allows users to construct statistical models that can examine the relationship of several variables on multiple outcomes.
- It is a combination of meta-analysis and another statistical: Structural Equation Modelling

## What is Structural Equation Modelling (SEM)?
- It is a powerful and flexible method of constructing statistical models within data science it is analogous to naive bayesian networks
- It is flexible because:
  - Not only can models with multiple variables and multiple outcomes be examined
  - But it can also examine models with multiple pathways:

![image](https://user-images.githubusercontent.com/96096344/153248352-fcdb61ca-e21b-461a-b93c-565f0bc1c25a.png)

- For example, advertising may have a knock on effect on sales by boosting the quality of hires due to greater brand consciousness. 
- Hence hiring more people would have a greater positive effect on sales as the quality of people being hired are better. Training would also affect hiring by improving the quality of the people hired. 
- Hence in this example we have three direct pathways to improving sales
  - Advertising -> Sales
  - Hiring -> Sales
  - Training -> Sales

- and there are three indirect pathways or knock on effect pathways
  - Advertising -> Hiring -> Sales
  - Training -> Hiring -> Sales

- One other powerful feature of SEM is that you can statistically examine whether the constructed model fits the data well.
- Essentially, how well does the user's idea of reality fit the observed data, which is a measure of reality
- The group of statistics that quantify how well the model fits the data are called goodness of fit indices (GOF)

## The present simulation
- The present study examines how these GOF indices perform using a novel MASEM technique developed by Jak and Cheung in 2019.
- Existing literature indicates that it is unlikely that GOF indices will behave differently than usual SEM analyses.
- However simulations under different statistical conditions must still be performed to examine if there are particular conditions under which the GOF performs unexpectedly
