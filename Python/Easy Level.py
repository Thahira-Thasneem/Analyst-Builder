# 1. Tesla Models:
# Solution:

import pandas as pd;

tesla_models['profit'] = (tesla_models['car_price'] - tesla_models['production_cost'])* tesla_models['cars_sold']
tesla_models.sort_values(by='profit', ascending = False).head(1)

# 2. Heart Attack Risk
# Solution:

import pandas as pd;

patients[(patients['age'] >= 50) & (patients['cholesterol'] >= 240) & (patients['weight'] >= 200)].sort_values(by='cholesterol', ascending = False)

# 3. Apply Discount
# Solution:

import pandas as pd;

customers[(customers['age'] >= 65) | (customers['total_purchase'] > 200)].shape[0]

# 4. Million Dollar Store
# Solution:

import pandas as pd;

avg = stores.groupby('store_id')['revenue'].mean().reset_index().rename(columns={'revenue': 'avg_revenue'})
avg['avg_revenue'] = round(avg['avg_revenue'],2)
new = avg[(avg['avg_revenue'] > 1000000)]

# 5. Chocolate
# Solution:

import pandas as pd;

bakery_items[bakery_items['product_name'].str.contains('Chocolate')]

# 6. On The Way Out
# Solution:

import pandas as pd;

employees['birth_date'] = pd.to_datetime(employees['birth_date'])
employees.sort_values(by='birth_date', inplace = True)
employees[['employee_id']].head(3)

# 7. Sandwich Generation
# Solution:

import pandas as pd;

bread_meats = pd.merge(bread_table.assign(key=1), meat_table.assign(key=1), on='key').drop('key', axis =1)
bread_meats[['bread_name', 'meat_name']].sort_values(by=['bread_name', 'meat_name'])

# 8. Electric Bike Replacement
# Solution:

import pandas as pd;

bikes[bikes['miles'] > 10000]['bike_id'].count()

# 9. Car Failure
# Solution:

import pandas as pd;

inspections[(inspections['critical_issues'] == 0) & (inspections['minor_issues'] <= 3)][['owner_name','vehicle']].sort_values(by='owner_name')

# 10. Perfect Data Analyst
# Solution:

import pandas as pd;

x = candidates[(candidates['sql_experience'] == 'X') & (candidates['problem_solving'] == 'X') & (candidates['domain_knowledge'] == 'X') &((candidates['python'] == 'X') | (candidates['r_programming'] == 'X'))]
x[['candidate_id']]

# 11. Costco Rotisserie Loss
# Solution:

import pandas as pd;

sales['lost_revenue_millions'].sum().round(0)


