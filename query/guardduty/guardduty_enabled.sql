select
  -- Required Columns
  'arn:' || r.partition || '::' || r.region || ':' || r.account_id as resource,
  case
    when r.region = any (
      ARRAY ['af-south-1', 'ap-northeast-3', 'ap-southeast-3', 'eu-south-1', 'cn-north-1', 'cn-northwest-1', 'me-south-1', 'us-gov-east-1']
    ) then 'skip'
    when status = 'ENABLED' then 'ok'
    else 'alarm'
  end as status,
  case
    when r.region = any ( ARRAY ['af-south-1', 'ap-northeast-3', 'ap-southeast-3', 'eu-south-1', 'cn-north-1', 'cn-northwest-1', 'me-south-1', 'us-gov-east-1'] ) then 'Region not supported.'
    when status is null then 'No GuardDuty detector found.'
    when status = 'ENABLED' then d.title || ' enabled.'
    else d.title || ' disabled.'
  end as reason,
  -- Additional Dimensions
  r.region,
  r.account_id
from
  aws_region as r
  left join aws_guardduty_detector d on d.region = r.name;
