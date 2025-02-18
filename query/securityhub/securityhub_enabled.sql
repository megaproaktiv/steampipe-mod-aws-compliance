select
  -- Required Columns
  'arn:' || r.partition || '::' || r.region || ':' || r.account_id as resource,
  case
    when r.region = any (ARRAY ['af-south-1', 'eu-south-1', 'cn-north-1', 'cn-northwest-1', 'ap-northeast-3']) then 'skip'
    when h.hub_arn is not null then 'ok'
    else 'alarm'
  end as status,
  case
    when r.region = any (ARRAY ['af-south-1', 'eu-south-1', 'cn-north-1', 'cn-northwest-1', 'ap-northeast-3']) then 'Region not supported.'
    when h.hub_arn is not null then h.title || ' enabled.'
    else 'Security Hub disabled in ' || r.region || '.'
  end as reason,
  -- Additional Dimensions
  r.region,
  r.account_id
from
  aws_region as r
  left join aws_securityhub_hub as h on h.region = r.name;
