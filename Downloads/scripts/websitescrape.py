import pyspark
from pyspark.sql import SparkSession
from pyspark.sql.types import *
import requests
from bs4 import BeautifulSoup
import csv

#Create a SparkSession

spark = SparkSession.builder.getOrCreate()

#Read the HTML of the website.
response = requests.get("https://www.example.com/")
html = response.content

# Parse the HTML to get the data that you want to scrape.
soup = BeautifulSoup(html, "html.parser")

# Get the data that you want to scrape.
data = []
for element in soup.find_all("div", class_="product-info"): #The find_all() method is used to find all of the elements on the page that match the specified CSS selector.
    name = element.find("h2").text
    price = element.find("span", class_="price").text
    data.append((name, price))

# Create a Spark DataFrame from the data.

schema = StructType([StructField("name", StringType(), True), StructField("price", StringType(), True)])
df = spark.createDataFrame(data, schema)

# Save the Spark DataFrame to a CSV file.

df.write.csv("products.csv", header=True)


#This will create a CSV file called products.csv containing the scraped data.
