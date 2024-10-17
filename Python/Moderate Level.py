
# 1. Senior Citizen Discount
# Solution:

import pandas as pd;
from datetime import datetime;

customers.head()

customers['birth_date'] = pd.to_datetime(customers['birth_date'], format = '%m/%d/%Y')
current_date = datetime.strptime('1/1/2023', '%m/%d/%Y')

customers['age'] = (current_date - customers['birth_date']).dt.days//365

seniors = customers[customers['age'] > 55]
seniors.sort_values(by='customer_id')[['customer_id']]

# 2. LinkedIn Famous
# Solution:

import pandas as pd;

linkedin_posts['popularity'] = linkedin_posts['actions']/linkedin_posts['impressions']*100

linkedin_posts[linkedin_posts['popularity'] > 1].sort_values(by='popularity', ascending = False)[['post_id','popularity']]

# 3. Company Wide Increase
# Solution:

import pandas as pd;

employees.head()

def new_sal(row):
  if row.pay_level == 1:
    return row.salary*1.1
  elif row.pay_level == 2:
    return row.salary*1.15
  elif row.pay_level == 3:
    return row.salary*3
  else:
    return row.salary
  
employees['new_salary'] = employees.apply(new_sal, axis = 1)
employees

# 4. Social Media Addicts
# Solution:

import pandas as pd;

avg = user_time['media_time_minutes'].mean()
new = user_time[user_time['media_time_minutes'] > avg] 

new.merge(users, how='inner')[['first_name']].sort_values(by='first_name')

# 5. Bike Price
# Solution:

import pandas as pd;

inventory[(inventory['bike_sold'] =='Y')  & (inventory.bike_price.notna())].bike_price.mean().round(2) 

# 6. Direct Reports
# Solution:

import pandas as pd;

managers = direct_reports[direct_reports.position.str.contains('Manager')]
direct_reports = direct_reports.groupby('managers_id').size().reset_index(name='direct_reports')

manager_reports = managers.merge(direct_reports, left_on='employee_id', right_on='managers_id', how='left')

manager_reports[['employee_id', 'position', 'direct_reports']].rename(columns={'employee_id': 'manager_id', 'position': 'manager_position'})

# 7. Food Divides Us
# Solution:

import pandas as pd;

food_regions.groupby('region')['fast_food_millions'].sum().reset_index().sort_values(by='fast_food_millions', ascending=False)[['region']].head(1)

# 8. Kroger's Members
# Solution:

import pandas as pd;

members = customers[(customers.has_member_card == 'Y')]['has_member_card'].count()
round(members/customers.kroger_id.count()*100, 2)

# 9. Tech Layoffs
# Solution:

import pandas as pd;

tech_layoffs['percentage'] = round(tech_layoffs['employees_fired']/tech_layoffs['company_size']*100 , 2)
tech_layoffs[['company','percentage']].sort_values(by='company')

# 10. Separation
# Solution:

import pandas as pd;

bad_data['n_id'] = bad_data.id.str[0:5]
bad_data['first_name'] = bad_data.id.str[5:]

bad_data[['n_id', 'first_name']]

# 11. TMI (Too Much Information)
# Solution:

import pandas as pd;

customers['first_name'] = customers.full_name.str.split(' ').str[0]
customers[['customer_id', 'first_name']]

# 12. Shrink-flation
# Solution:

import pandas as pd;

products['size_change_percentage'] = round((products.new_size-products.original_size)/products.original_size*100, 0)
products['price_change_percentage'] = round((products.new_price-products.original_price)/products.original_price*100, 0)

products['shrinkflation_flag'] = (products['new_size'] < products['original_size']) & (products['new_price'] >= products['original_price'])
products['shrinkflation_flag'] = products['shrinkflation_flag'].map({True: 'True', False: 'False'})

products[['product_name', 'size_change_percentage', 'price_change_percentage', 'shrinkflation_flag']].sort_values(by='product_name')



