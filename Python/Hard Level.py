
# 1. Temperature Fluctuations:
# Solution:

import pandas as pd;

temperatures['prev_temp']=temperatures['temperature'].shift(1)
temperatures[temperatures['temperature'] > temperatures['prev_temp']][['date']].sort_values(by='date')


# 2. Kelly's 3rd purchase
# Solution:

import pandas as pd;

purchases['ranks']=purchases.groupby('customer_id')['transaction_id'].rank()
third_purchases = purchases[purchases['ranks'] == 3].copy()
third_purchases['discounted_amount'] = third_purchases['amount']*0.67

third_purchases[['customer_id','transaction_id','amount', 'discounted_amount']].sort_values(by='customer_id')
