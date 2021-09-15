select
  -- Required Columns
  arn as resource,
  case
    when restrictions -> 'GeoRestriction'->> 'RestrictionType' = 'none' then 'alarm'
    else 'ok'
  end as status,
  case
    when restrictions -> 'GeoRestriction'->> 'RestrictionType' = 'none' then title || ' geo restriction disabled.'
    else title || ' geo restriction enabled.'
  end as reason,
  -- Additional Dimensions
  region,
  account_id
from
  aws_cloudfront_distribution;