-- 1.What is the count of distinct cities in the dataset?
	  select distinct city as distinct_cities from amazon;
-- Insighamazonts:
-- a) Diversity of Locations
-- b) Coverage Gaps
-- c) Key Cities
-- Recommendations:
-- a) Analyze City Distribution
-- b) Expand to Untapped Regions
-- c) Target High-Value Locations
-- d) Evaluate Logistics and Operations

-- 2.For each branch, what is the corresponding city?
	  select distinct branch, city from amazon;
-- Insights:
-- a) Branch-City Relationships
-- b) Operational Overlap
-- c) Coverage Analysis
-- Recommendations:
-- a) Optimize Branch Presence
-- b) Expand to New Cities
-- c) Performance-Based Allocation
 
 -- 3.What is the count of distinct product lines in the dataset? 
 select count(distinct `product line`) as distinct_product_lines from amazon;
-- Insights:
-- a) Product Line Variety
-- b) Customer Needs and Trends
-- c) Market Coverage
-- d) Potential Gaps
-- Recommendations:
-- a) Focus on High-Performing Product Lines
-- b) Optimize Low-Performing Product Lines
-- c) Diversify Offerings
-- d) Personalize Marketing

 -- 4.Which payment method occurs most frequently?
	   select payment, count(*) as frequency from amazon
       group by payment 
       order by frequency desc
       limit 1;
-- Insights:
-- a) Most Popular Payment Method
-- b) Customer Behavior Trends
-- c) Potential Barriers
-- Recommendations:
-- a) Optimize Popular Payment Methods
-- b) Promote Underutilized Methods
-- c) Improve Payment Security & Trust
-- d) Expand Payment Options
       
 -- 5.Which product line has the highest sales?  
	   select `product line` , count(*) as total_sales from amazon 
       group by `product line`
       order by total_sales desc
       limit 1;
-- Insights:
-- a) Best-Selling Product Line
-- b) Customer Demand Trends
-- c) Market Opportunity
-- Recommendations:
-- a) Double Down on the Best-Selling Category
-- b) Enhance Cross-Selling & Bundling
-- c) Analyze Customer Reviews & Feedback
-- d) Expand Marketing & Ad Spend for Trending Categories
       
-- 6.How much revenue is generated each month?   
	select monthname, sum(total) as revenue from amazon
	group by monthname
	order by revenue desc;
-- Insights:
-- a) Highest Revenue Month
-- b) Sales Seasonality
-- c) Low-Revenue Months
-- Recommendations:
-- a) Maximize High-Revenue Months
-- b) Boost Sales in Low-Revenue Months
-- c) Leverage Data for Forecasting
-- d) Customer Retention Strategies
     
-- 7.In which month did the cost of goods sold reach its peak?
	 select monthname, sum(cogs) as total_cogs from amazon
     group by monthname
     order by total_cogs desc
     limit 1;
-- Insights:
-- a) Highest Cost of Goods Sold(COGS) Month
-- b) Sales vs. COGS Relationship
-- c) Seasonal Cost Variations
-- Recommendations:
-- a) Optimize Inventory & Supplier Pricing
-- b) Improve Pricing & Profit Margins
-- c) Monitor Discounts & Promotions Impact
-- d) Reduce Waste & Overstocking

-- 8.Which product line generated the highest revenue?
	 select `product line`, sum(total) as highest_revenue from amazon
     group by `product line`
     order by highest_revenue desc
     limit 1;
-- Insights:
-- a) Top Revenue-Generating Product Line
-- b) Consumer Demand & Market Trends
-- c) Competitive Edge & Pricing Strategy
-- Recommendations:
-- a) Expand Inventory & Promotions for Best-Selling Product Line
-- b) Optimize Supply Chain & Stock Management
-- c) Leverage Cross-Selling & Upselling
-- d) Analyze Profitability, Not Just Revenue

-- 9.In which city was the highest revenue recorded?
	 select city,sum(total) as highest_revenue from amazon
     group by city
     order by highest_revenue desc
     limit 1;
-- Insights:
-- a) Top Revenue-Generating City
-- b) Urban vs. Rural Consumer Behavior
-- c) Regional Demand & Growth Potential
-- Recommendations:
-- a) Expand Fulfillment & Logistics in Top Cities
-- b) Hyperlocal Marketing for Further Growth
-- c) Analyze Product Preferences in the Top City
-- d) Boost Sales in Underperforming Cities
     
-- 10.Which product line incurred the highest Value Added Tax?
	  select `product line`, sum(`Tax 5%`) as total_vat from amazon
      group by `product line`
      order by total_vat desc
      limit 1;
-- Insights:
-- a) Product Line with the Highest VAT Contribution
-- b) High Revenue vs. High Tax Impact
-- c) Government Regulations & Compliance
-- Recommendations:
-- a) Optimize Pricing to Offset Tax Impact
-- b) Monitor Profitability in High-VAT Categories
-- c) Expand High-Tax Product Lines Strategically
-- d) Analyze Regional VAT Differences
      
-- 11.For each product line, add a column indicating "Good" if its sales are above average, otherwise "Bad."
	  select `product line`, sum(total) as total_sales,
      case
      when sum(total) > (select avg(total_sales) from (select `product line`, sum(total) as total_sales from amazon
      group by `product line`
      ) as subquery
      ) then 'Good'
      else 'Bad'
      end as sales_status
      from amazon
      group by `product line`
      order by total_sales desc;
-- Insights:
-- a) Sales Performance Classification
-- b) Top Product Lines vs. Underperforming One
-- c) Market Trends & Demand Insights
-- Recommendations:
-- a) Expand Inventory & Variants
-- b) Increase Marketing & Promotions
-- c) Analyze Customer Demand & Market Fit
-- d) Revise Pricing & Discounts
	
    -- 12.Identify the branch that exceeded the average number of products sold.
		  select branch, sum(quantity) as total_quantity from amazon
          group by branch
          having sum(quantity) > (select avg(quantity)from amazon)
          limit 1;
-- Insights:
-- a) Top-Performing Branch (Above-Average Sales Quantity)
-- b) Branch Demand & Sales Volume
-- c) Logistics & Stocking Implications
-- Recommendations:
-- a) Optimize Inventory Management
-- b) Leverage Regional Marketing & Promotions
-- c) Analyze Causes of Low Sales Volume
-- d) Improve Distribution Strategy
          
-- 13.Which product line is most frequently associated with each gender?
	  select `product line`, gender, count(*) as frequency
      from amazon 
      group by gender, `product line`
      order by frequency desc;
-- Insights:
-- a) Sales Distribution by Gender and Product Line
-- b) Gender-Specific Demand Trends
-- c) Potential for Gender-Specific Marketing
-- Recommendations:
-- a) Personalize Marketing Efforts
-- b) Improve Product Availability
-- c) Target Underrepresented Gender
-- d) Review Product Design & Appeal
      
-- 14.Calculate the average rating for each product line.
	  select `product line`, avg(rating) as avg_rating from amazon
      group by `product line`
      order by avg_rating desc;
-- Insights:
-- a) Top-Rated Product Lines
-- b) Consumer Sentiment & Trust
-- c) Sales vs. Customer Satisfaction
-- Recommendations:
-- a) Leverage Customer Testimonials & Reviews
-- b) Focus on Product Line Expansion
-- c) Address Customer Feedback
-- d) Improve Customer Support
      
-- 15.Count the sales occurrences for each time of day on every weekday.
	  select timeofday, dayname, count(*) as sales_occurence from amazon
      group by timeofday, dayname
      order by sales_occurence desc;
-- Insights:
-- a) Peak Sales Time and Days
-- b) Identifying Patterns in Shopping Behavior
-- c) Opportunity for Optimization
-- Recommendations:
-- a) Maximize Marketing Impact
-- b) Ensure Adequate Inventory
-- c) Offer Time-Sensitive Promotions
-- d) Reevaluate Marketing Efforts
      
-- 16.Identify the customer type contributing the highest revenue.
	  select `customer type`, sum(total) as highest_revenue from amazon
      group by `customer type`
      order by highest_revenue desc
      limit 1;
-- Insights:
-- a) Top Revenue-Generating Customer Type
-- b) Customer Type and Purchasing Behavior
-- c) Sales Strategy Based on Customer Type
-- Recommendations:
-- a) Enhance Product Offering for the Dominant Customer Type
-- b) Optimize Customer Experience for High-Value Clients
-- c) Assess the Needs of the Underperforming Segment
-- d) Cross-Sell or Upsell Products Between Segments
      
-- 17.Determine the city with the highest VAT percentage.
	  select city, sum(`Tax 5%`) as highest_vat, sum(total) as total_sales, (sum(`Tax 5%`)/ sum(total)) * 100 as vat_percentage
      from amazon
      group by city
      order by vat_percentage desc
      limit 1;
-- Insights:
-- a) City with the Highest VAT and Sales
-- b) City Performance Overview
-- Recommendations:
-- a) Evaluate Product Pricing & Taxation
-- b) Targeted Marketing & Product Selection
-- c) Promote Taxable Items
-- d) Reevaluate Product Offering
      
-- 18.Identify the customer type with the highest VAT payments.
	   select `customer type`, sum(`Tax 5%`) as highest_vat_payments from amazon
       group by `Customer type`
       order by highest_vat_payments desc;
     
-- Insights:
-- a) Customer Type with the Highest VAT Payments
-- b) Tax Contributions by Customer Type
-- Recommendations:
-- a) Focus on High-Value Offerings for This Segment
-- b) Develop Tax-Friendly Promotions
-- c) Promote High-Tax Products
-- d) Upsell and Cross-Sell to Increase Tax Payments
       
-- 19.What is the count of distinct customer types in the dataset?
	  select count(distinct(`Customer type`)) as distinct_customers from amazon;
-- Insights:
-- a) customer types
-- b) diverse types
-- Recommendations:
-- a) Targeting and Marketing Strategies
-- b) Product Offering Customization
-- c) Customer Retention Efforts
      
-- 20.What is the count of distinct payment methods in the dataset?
	  select count(distinct(payment)) as distinct_payment from amazon;
-- Insights:
-- a) payment methods used by customers in the dataset.
-- b) the diversity of payment options customer
-- Recommendations:
-- a) Payment Method Optimization
-- b) Payment-Related Promotions
-- c) Payment Security & Convenience
      
-- 21.Which customer type occurs most frequently?
	  select `Customer type`, count(`Customer type`) as frequency from amazon
      group by `Customer type`
      order by frequency desc
      limit 1;
-- Insights:
-- a) customer type
-- b) marketing strategies, product offerings, and pricing models
-- Recommendations:
-- a) Optimize Product Offerings for the Largest Customer Type
-- b) Targeted Marketing Strategies
-- c) Customer Retention Programs
      
-- 22.Identify the customer type with the highest purchase frequency.
	  select `Customer type`, count(*) as highest_purchase from amazon
      group by `Customer type`
      order by highest_purchase desc
      limit 1;
-- Insights:
-- a) customer type individual or bussiness
-- b) customer type with the highest number of purchases
-- Recommendations:
-- a) Target Frequent Purchasers with Exclusive Offers
-- b) Customer Retention
-- c) Optimize Product Offerings Based on Purchase Behavior
      
-- 23.Determine the predominant gender among customers.
	  select gender, count(*) as predominant_gender from amazon
      group by gender
      order by predominant_gender desc
      limit 1;
-- Insights:
-- a) Most Predominant Gender in Sales Females
-- b) Most Predominant Gender in Sales Males
-- Recommendations:
-- a) Tailor Product Offerings to the Predominant Gender
-- b) Targeted Marketing Campaigns
-- c) Customer Experience Optimization
      
-- 24.Examine the distribution of genders within each branch.
	select branch, gender, count(*) as gender_count from amazon
    group by gender, branch
    order by gender_count desc;
-- Insights:
-- a) gender distribution across different branches locations females
-- b) gender distribution across different branches locations males 
-- Recommendations:
-- a) Tailored Branch-Specific Marketing Campaigns
-- b) Adjust Product Mix by Branch
-- c) Branch-Specific Promotions and Discounts
      
-- 25.Identify the time of day when customers provide the most ratings.
	  select timeofday, count(rating) as rating_count from amazon
      group by timeofday
      order by rating_count desc
      limit 1;
-- Insights:
-- a) Time of Day with the Most Ratings afternoon by customers
-- b) Time of Day with the Most Ratings morning, evening by customers
-- Recommendations:
-- a) Optimize Customer Engagement During Peak Rating Times
-- b) Targeted Marketing Campaigns Based on Timing
-- c) Enhanced Customer Support During High-Rating Times
      
-- 26.Determine the time of day with the highest customer ratings for each branch.
	  select branch, timeofday, avg(rating) as average_rating from amazon
      group by branch, timeofday
      order by average_rating desc;
-- Insights:
-- a) Average Rating by Branch and Time of Day
-- b) highest average ratings and during which times
-- Recommendations:
-- a) Focus on Improving Low-Rated Times
-- b) Leverage High-Performing Branches and Times for Marketing
-- c) Optimize Customer Service During Peak Rating Times
      
-- 27.Identify the day of the week with the highest average ratings.
	  select dayname, avg(rating) as highest_rating from amazon
      group by dayname
      order by highest_rating desc
      limit 1;
-- Insights:
-- a) Day of the Week with the Highest Average Rating
-- Recommendations:
-- a) Optimize Marketing and Promotions for High-Rating Days
-- b) Leverage Positive Sentiment on High-Rating Days
-- c) Adjust Operations for Higher Customer Satisfaction
      
-- 28.Determine the day of the week with the highest average ratings for each branch.
	  select branch, dayname, avg(rating) as avg_rating from amazon
      group by branch, dayname
      order by avg_rating desc;
-- Insights:
-- a) Average Rating by Branch and Day of the Week
-- Recommendations:
-- a) Optimize Operations Based on Day and Branch Performance
-- b) Tailor Marketing Campaigns to High-Performing Branches and Days
-- c) Leverage Positive Days to Boost Customer Engagement