## v0.32 [2022-05-11]

_Dependencies_

- AWS plugin `v0.59.0` or higher is now required. ([#390](https://github.com/turbot/steampipe-mod-aws-compliance/pull/390))

_What's new?_

- New PCI v3.2.1 benchmark added: ([#385](https://github.com/turbot/steampipe-mod-aws-compliance/pull/385))
  - OpenSearch (`steampipe check benchmark.pci_v321_opensearch`)
- New PCI v3.2.1 controls added: ([#385](https://github.com/turbot/steampipe-mod-aws-compliance/pull/385))
  - OpenSearch.1 (`steampipe check control.pci_v321_opensearch_1`)
  - OpenSearch.2 (`steampipe check control.pci_v321_opensearch_2`)

## v0.31 [2022-05-09]

_Enhancements_

- Updated docs/index.md and README with new dashboard screenshots and latest format. ([#379](https://github.com/turbot/steampipe-mod-aws-compliance/pull/379))

_Bug fixes_

- Fixed incorrect doc link for `pci_v321_s3_5` control. ([#381](https://github.com/turbot/steampipe-mod-aws-compliance/pull/381))

## v0.30 [2022-05-03]

_Bug fixes_

- Fixed `resource` column in `guardduty_enabled` query to be the AWS region ARN instead of the GuardDuty detector ARN.
- Fixed `resource` column in `securityhub_enabled` query to be the AWS region ARN instead of the Security Hub hub ARN.
- Renamed `soc2` directory and filenames to use `soc_2` (no impact on benchmarks or controls).

## v0.29 [2022-04-27]

_Enhancements_

- Added `category`, `service`, and `type` tags to benchmarks and controls. ([#375](https://github.com/turbot/steampipe-mod-aws-compliance/pull/375))
- Improved reason in `iam_root_user_hardware_mfa_enabled` query when a virtual MFA device is enabled.

_Bug fixes_

- Fixed `resource` in `iam_access_analyzer_enabled` query to be the region ARN.

## v0.28 [2022-04-22]

_Enhancements_

- Renamed several IAM policy and account password policy query names to be more consistent with other query names. ([#367](https://github.com/turbot/steampipe-mod-aws-compliance/pull/367))

_Bug fixes_

- The `cis_v130_1_16` and `cis_v140_1_16` controls now only show results for attached IAM policies. ([#367](https://github.com/turbot/steampipe-mod-aws-compliance/pull/367))
- The `iam_all_policy_no_service_wild_card` control now only checks customer managed IAM policies for full service access statements. ([#367](https://github.com/turbot/steampipe-mod-aws-compliance/pull/367))
- Fixed `iam_all_policy_no_service_wild_card` and `foundational_security_iam_21` controls not alarming if any policy statements grant `*:*`, as these statements also grant full access to at least 1 AWS service. ([#367](https://github.com/turbot/steampipe-mod-aws-compliance/pull/367))
- Removed `iam_all_policy_no_service_wild_card.sql` and `iam_policy_in_use.sql` queries as these were unused by any controls. ([#367](https://github.com/turbot/steampipe-mod-aws-compliance/pull/367))

## v0.27 [2022-04-21]

_What's new?_

- New AWS Foundational Security Best Practices controls added:
  - CloudFront.9
  - ECR.3
  - ELB.10
  - S3.11

_Bug fixes_

- Fixed the `guardduty_enabled` query to only check if GuardDuty is enabled and no longer check if S3 logging is enabled. ([#360](https://github.com/turbot/steampipe-mod-aws-compliance/pull/360))

## v0.26 [2022-04-18]

_Bug fixes_

- The `foundational_security_networkfirewall` benchmark is now a child of the `foundational_security` benchmark.

## v0.25 [2021-04-01]

_What's new?_

- New AWS Foundational Security Best Practices controls added:
  - AutoScaling.2
  - AutoScaling.5
  - CloudFront.7
  - CloudFront.8
  - CodeBuild.4
  - CodeBuild.5
  - EC2.21
  - EC2.22
  - Lambda.5
  - NetworkFirewall.5
  - RDS.24
  - RDS.25
  - Redshift.8
  - S3.10
  - S3.9

## v0.24 [2022-03-30]

_Bug fixes_

- Fixed the `dynamodb_table_auto_scaling_enabled` query to correctly check if the tables have on-demand capacity mode enabled or not ([#350](https://github.com/turbot/steampipe-mod-aws-compliance/pull/350))

## v0.23 [2022-02-02]

_Enhancements_

- Updated the following queries to use `cidr_ipv4` column instead of the deprecated `cidr_ip` column ([#342](https://github.com/turbot/steampipe-mod-aws-compliance/pull/342))
  - vpc_security_group_allows_ingress_authorized_ports
  - vpc_security_group_remote_administration
  - vpc_security_group_restrict_ingress_common_ports_all
  - vpc_security_group_restrict_ingress_ssh_all
  - vpc_security_group_restrict_ingress_tcp_udp_all
  - vpc_security_group_restricted_common_ports

## v0.22 [2021-12-08]

_What's new?_

- RBI Cyber Security Framework benchmark (`steampipe check benchmark.rbi_cyber_security`) now includes 17 new controls and 7 new queries ([331](https://github.com/turbot/steampipe-mod-aws-compliance/pull/331))

_Bug fixes_

- Fixed the `config_enabled_all_regions` query to correctly evaluate if AWS Config is enabled in the account for the local Region and is recording all resources ([325](https://github.com/turbot/steampipe-mod-aws-compliance/pull/325))

## v0.21 [2021-11-24]

_What's new?_

- New NIST CSF benchmarks added:
  - DE.CM-2
  - DE.CM-5
  - ID.AM-1
  - ID.AM-5
  - ID.RA-5
  - ID.SC-4
  - PR.DS-7
  - PR.DS-8
  - PR.IP-2
  - PR.IP-8
  - PR.IP-9
  - PR.IP-12
  - RC.RP-1
  - RS.MI-3
  - RS.RP-1

## v0.20 [2021-11-18]

_Bug fixes_

- Fixed the `dynamodb_table_auto_scaling_enabled` query to correctly evaluate if auto scaling is enabled for a DynamoDB table instead of throwing a validation error ([319](https://github.com/turbot/steampipe-mod-aws-compliance/pull/319))

## v0.19 [2021-11-17]

_What's new?_

- Added: AWS Audit Manager Control Tower Guardrails benchmark (`steampipe check aws_compliance.benchmark.audit_manager_control_tower`)

_Bug fixes_

- Fixed the `backup_plan_min_retention_35_days` query to correctly evaluate backup plan rules where the lifecycle is set to `Never Expire` ([314](https://github.com/turbot/steampipe-mod-aws-compliance/pull/314))

## v0.18 [2021-11-10]

_What's new?_

- Additional benchmarks (`hipaa_164_308` and `hipaa_164.312`) have been added to the `hipaa` benchmark to improve its structure and readability
- New HIPAA benchmarks added:
  - 164.308(a)(1)(ii)(A) Risk analysis
  - 164.308(a)(4)(ii)(A) Isolating health care clearinghouse functions
  - 164.308(a)(5)(ii)(B) Protection from malicious software
  - 164.308(a)(5)(ii)(C) Log-in monitoring
  - 164.308(a)(5)(ii)(D) Password management
  - 164.308(a)(7)(ii)(B) Disaster recovery plan
  - 164.308(a)(7)(ii)(C) Emergency mode operation plan
  - 164.308(a)(8) Evaluation

## v0.17 [2021-10-27]

_What's new?_

- Added: System and Organization Controls (SOC 2) benchmark (`steampipe check aws_compliance.benchmark.soc_2`)

## v0.16 [2021-10-12]

_What's new?_

- New AWS Foundational Security Best Practices controls added:
  - ES.4
  - ES.5

_Bug fixes_

- Fixed the metric filter pattern in the `log_metric_filter_unauthorized_api` query as per the CIS documentation ([#294](https://github.com/turbot/steampipe-mod-aws-compliance/pull/294))
- Fixed the `rds_db_instance_logging_enabled` query to correctly evaluate if logging is enabled for `SQL Server Express Edition` DB engine type ([296](https://github.com/turbot/steampipe-mod-aws-compliance/pull/296))

## v0.15 [2021-09-27]

_Bug fixes_

- Fixed the metric filter pattern in the `log_metric_filter_organization` query as per the CIS documentation ([#271](https://github.com/turbot/steampipe-mod-aws-compliance/pull/289))
- `cis_v140_1_16` control now refers to `iam_all_policy_no_star_star` query which evaluates all the attached IAM policies(both AWS and customer managed) instead of only IAM customer managed policies ([#281](https://github.com/turbot/steampipe-mod-aws-compliance/pull/281))
- `foundational_security_iam_1` control now refers to `iam_custom_policy_no_star_star` query which only evaluates IAM customer managed policies instead of evaluating both customer and AWS managed IAM policies ([#281](https://github.com/turbot/steampipe-mod-aws-compliance/pull/281))
- `foundational_security_iam_21` control now refers to `iam_custom_policy_no_service_wild_card` query which correctly checks if there are any IAM customer managed policies that allow wildcard access for services ([#281](https://github.com/turbot/steampipe-mod-aws-compliance/pull/281))

## v0.14 [2021-09-23]

_What's new?_

- Added: AWS General Data Protection Regulation(GDPR) benchmarks and controls (`steampipe check benchmark.gdpr`)

_Enhancements_

- `vpc_security_group_associated` control name has been renamed to `vpc_security_group_associated_to_eni` which now refers `vpc_security_group_associated_to_eni` query

_Bug fixes_

- `vpc_security_group_associated` query will no longer return duplicate security groups ([#283](https://github.com/turbot/steampipe-mod-aws-compliance/pull/283))
- Fixed the missing filter patterns in `log_metric_filter_root_login` and `log_metric_filter_unauthorized_api` queries ([#285](https://github.com/turbot/steampipe-mod-aws-compliance/pull/285)) ([#278](https://github.com/turbot/steampipe-mod-aws-compliance/pull/278))
- `cis_v130_1_12` and `cis_v140_1_12` controls will now render `<root_account>` user status as `info` ([#286](https://github.com/turbot/steampipe-mod-aws-compliance/pull/286))

## v0.13 [2021-09-09]

_Bug fixes_

- `foundational_security_elasticbeanstalk_1` control will now correctly reference the `elastic_beanstalk_enhanced_health_reporting_enabled` query instead of the `apigateway_stage_logging_enabled` query

## v0.12 [2021-08-23]

_What's new?_

- New AWS Foundational Security Best Practices controls added:
  - APIGateway.5
  - EC2.15
  - EC2.19
  - ElasticBeanstalk.1
  - ELB.7
  - Lambda.4
  - RDS.18
  - RDS.19
  - RDS.20
  - RDS.21
  - RDS.22
  - RDS.23
  - SQS.1

## v0.11 [2021-08-05]

_What's new?_

- New AWS Foundational Security Best Practices controls added:
  - APIGateway.3
  - APIGateway.4
  - CloudFront.5
  - CloudFront.6
  - EC2.16
  - EC2.17
  - EC2.18
  - ECS.1
  - ECS.2
  - ES.4
  - ES.6
  - ES.7
  - ES.8
  - IAM.21
  - RDS.15
  - RDS.16
  - RDS.17
  - Redshift.4
  - S3.8

## v0.10 [2021-07-23]

_Bug fixes_

- Fixed: Update multiple CloudTrail, CloudWatch, Config, Lambda, and S3 queries to work properly with multi-account connections ([#247](https://github.com/turbot/steampipe-mod-aws-compliance/pull/247))
- Fixed: Cleanup unnecessary quotes in various CloudFront, CloudTrail, GuardDuty and S3 queries ([#249](https://github.com/turbot/steampipe-mod-aws-compliance/pull/249))

## v0.9 [2021-07-14]

_What's new?_

- Added: NIST 800-53 Revision 4 benchmark (`steampipe check benchmark.nist_800_53_rev_4`)

## v0.8 [2021-07-01]

_What's new?_

- Added: NIST Cybersecurity Framework (CSF) benchmark (`steampipe check benchmark.nist_csf`)
- New AWS Foundational Security Best Practices controls added:
  - CodeBuild.1
  - CodeBuild.2
- New HIPAA controls added:
  - codebuild_project_source_repo_oauth_configured
- New PCI v3.2.1 controls added:
  - CodeBuild.1

_Enhancements_

- Updated: AWS Foundational Security Best Practices benchmark title now includes `AWS` for better readability
- Updated: Update column reference `table_arn` to `arn` in `dynamodb_table_auto_scaling_enabled`, `dynamodb_table_encrypted_with_kms_cmk`, `dynamodb_table_in_backup_plan`, `dynamodb_table_point_in_time_recovery_enabled` queries
- Updated: Update column reference `file_system_arn` to `arn` in `efs_file_system_automatic_backups_enabled`, `efs_file_system_encrypt_data_at_rest` queries

## v0.7 [2021-06-24]

_What's new?_

- New RBI Cyber Security Framework controls added:
  - dynamodb_table_in_backup_plan
  - ebs_volume_in_backup_plan
  - efs_file_system_in_backup_plan
  - rds_db_instance_in_backup_plan

## v0.6 [2021-06-18]

_What's new?_

- Added: RBI Cyber Security Framework benchmark (`steampipe check benchmark.rbi_cyber_security`)
- New Foundational Security controls added:
  - CloudTrail.1
  - EC2.7
  - EFS.2
  - SSM.2
  - SSM.3
- New HIPAA controls added:
  - cloudtrail_trail_enabled
  - guardduty_finding_archived
  - vpc_vpn_tunnel_up
- New PCI v3.2.1 controls added:
  - SSM.1
  - SSM.2

_Enhancements_

- Updated: CIS v1.3.0 and v1.4.0 benchmarks and controls now include the `service` tag
- Updated: Replaced `benchmark` tag for all benchmarks and controls with framework specific tags, e.g., `cis = true`, `hipaa = true`

## v0.5 [2021-06-15]

_What's new?_

- Added: HIPAA benchmark (`steampipe check benchmark.hipaa`)

## v0.4 [2021-06-03]

_What's new?_

- Added: CIS v1.4.0 benchmark (`steampipe check benchmark.cis_v140`)
- Added: AWS Foundational Security Best Practices benchmark (`steampipe check benchmark.foundational_security`)

## v0.3 [2021-05-28]

_Bug fixes_

- Minor fixes in the docs

## v0.2 [2021-05-27]

_What's new?_

- Added: Documentation for various PCI v3.2.1 benchmarks and controls
- New PCI v3.2.1 controls added
  - CloudWatch.1
  - CodeBuild.2
  - EC2.3
  - ELBV2.2
  - GuardDuty.1
  - S3.3

_Bug fixes_

- Fixed: `autoscaling_group_with_lb_use_healthcheck` query should skip groups that aren't associated with a load balancer ([#30](https://github.com/turbot/steampipe-mod-aws-compliance/pull/30))
