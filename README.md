# What you need

1. Libararies
 - JDBC (mysql-connector-java)
 - jsoup 1.13.1
 - selenium-java-3.141.5
 
2. Chromedriver.exe

you should insert jsoup and selenium into  WEB-INF/lib folder!

3. SQL Table
 1) brand
  - brand_index: INT PK
  - Brandname: VARCHAR(45)
  - Brand_Link: VARCHAR(45)
  - brand_rank: VARCHAR(45)
  - brand_follwer: INT
  - brand_image: VARCHAR(300)
  
 2) ranks
  - brand_index : INT, PK
  - date : DATE, PK
  - follwers: INT
  
# How to use

  Start with search_engine.jsp

1. Add Brand what you want
 - brand name
 - brand's instagram id
 - brand image(by link)
 
 2. Brand page
  - Click the brand name
  - you will see recent 12 posts, and follwers
  
  3. yo can see the ranking of the brand by follwers


# Update in 08/12

1) if you click image in brand_page.jsp, move to the image link

2) you can get line graph of recent 5days.
 -> the follwer of every date is update when you start brand_page.jsp
 -> add ranks table
 
3) you can filter the ranking with follwers
 -> you should input both min and max
