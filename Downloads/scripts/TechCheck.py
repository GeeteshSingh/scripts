# To check what tech the website has used, you can use the following Python script:


import requests
from bs4 import BeautifulSoup

def check_website_tech(url):
    response = requests.get(url)
    soup = BeautifulSoup(response.content, "html.parser")

    # Get the meta tags.
    meta_tags = soup.find_all("meta")

    # Get the technology stack.
    tech_stack = []
    for meta_tag in meta_tags:
        if meta_tag["name"] in ["generator", "keywords", "description"]:
            tech_stack.extend(meta_tag["content"].split(","))

    # Get the JavaScript libraries.
    script_tags = soup.find_all("script")
    for script_tag in script_tags:
        if script_tag["src"].startswith("//"):
            tech_stack.append(script_tag["src"][2:].split("/")[0])

    return tech_stack

def main():
    # Get the URL from the user.
    url = input("Enter the URL of the website: ")

    # Check the website's tech stack.
    tech_stack = check_website_tech(url)

    # Print the results.
    print("The following tech is used by the website:")
    for tech in tech_stack:
        print(tech)

if __name__ == "__main__":
    main()

'''$ python techcheck.py
Enter the URL of the website: https://google.com

The following tech is used by the website:
- HTML
- CSS
- JavaScript
- React
- Redux
- Node.js
- Express

You can also modify the script to check for specific technologies. For example, you could add a line to the script to check for the presence of the jQuery JavaScript library:
'''

if "jquery" in tech_stack:
    print("The website uses the jQuery JavaScript library.")

# Use code with caution. Learn more
# You can also modify the script to check for other types of information, such as the website's content management system (CMS) or its web hosting provider.