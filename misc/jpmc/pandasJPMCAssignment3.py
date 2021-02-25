import pandas as pd
print("Pandas Version : {} ".format(pd.__version__))

data = pd.read_excel(r"C:\Users\Kaustubh\Documents\JPMCAssignment\Claim File.xlsx")
data = pd.DataFrame(data)
email = pd.read_excel(r"C:\Users\Kaustubh\Documents\JPMCAssignment\Mapping File.xlsx")
email = pd.DataFrame(email)
print("\nFirst Five Entries : ")
data.head()

#Printing last five entries
print("Last Five Entries  :")
last_five = data[-5:]
last_five

#Setting date wherever blank or NaN
print(type(data['Record Date']))
data['Record Date'].fillna('01/01/2019')

#Printing email of company with Maximum Dollar Equivalent
max_dollar_eq = data.loc[data['US Dollar Equivalent'] == max(data['US Dollar Equivalent'])]
max_dollar_eq = max_dollar_eq['Company Name'].to_string(index=False)
max_dollar_eq = " ".join(max_dollar_eq.split())

max_email = email.loc[email['Unique Names']== max_dollar_eq]
max_email = max_email['Email Address'].to_string(index=False)

print("Company Name : {} ".format(max_dollar_eq))
print("Email id : {}".format(max_email))


#Grouping data based on given parameters
print("Grouped By Sum of US Dollar Equivalent : \n")
print(data.groupby('Company Name')['US Dollar Equivalent'].agg(sum))
print("\nGrouped by Mean of US Dollar Equivalent : \n")
print(data.groupby('Company Name')['US Dollar Equivalent'].mean())
