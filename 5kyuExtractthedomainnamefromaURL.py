import re
def domain_name(url):
    regex = r'(?:http(s)?:\/\/)?(?:www\.)?(\w+)\.([a-z]{2,3})(\.[a-z]{2,3})?'
    m = re.match(regex, url)
    print(m.group(2))
    return m.group(2)


print(domain_name("www.xakep.ru"))