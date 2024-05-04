# **Cloud-Carbon-Footprint**
This project provisions and configures the [Cloud Carbon Footprint](https://www.cloudcarbonfootprint.org/).

## **DESCRIPTION**
Global greenhouse gas emissions from the technology sector are equal to or greater than those from the aviation industry, standing at about 3% for ICT and 2% for aviation, respectively. Within ICT, data centers account for about 1% of greenhouse gas emissions and global electricity use. Currently, most cloud providers do not disclose energy or carbon emissions from cloud usage to their customers (at an aggregate or individual level), which can be a challenge for organizations wishing to establish a baseline and reduce their carbon footprint. This application is a starting point to enable organizations to have greater visibility into their emissions across various cloud providers.

## **MOTIVATIONS**
To provide visibility and tools to measure, monitor, and reduce carbon emissions in the cloud. Cloud usage in estimated energy consumption and carbon emissions, producing metrics and carbon savings estimates that can be shared with employees, investors, and other stakeholders.

## **HOW TO USE**
```bash
tofu init
```
```bash
tofu plan
```
```bash
tofu apply
```

## **MANUAL CONFIGURATIONS**
### **AWS Billing Account**
- Created user `svc-cloud-carbon-footprint` with the policies in the folder `./policies/` and access key for application access to billing resources.
- In **Billing and Cost Management >> Cost and Usage Reports**, a report was created with the name `export-cloud-carbon-footprint` with the option of **report data integration >> Amazon Athena**, this report was directed to the S3 bucket `billing-cloud-carbon-footprint`.
- After generating the first report, which takes around 24 hours, in the bucket `billing-cloud-carbon-footprint`, a template file `.yaml` with the configurations for Amazon Athena via CloudFormation is generated. A stack named `stack-athena-cloud-carbon-footprint` was created for the AWS Athena settings, which generates its queries and sends them to the S3 bucket `query-cloud-carbon-footprint`.

### **Mongo ATLAS Cache**
- Create a user with reading and writing in the CCF database.
- In the secret MONGODB_URI use the model: mongodb+srv://user:password@cluster-name.

## **REFERENCES**
- [Cloud Carbon Footprint](https://www.cloudcarbonfootprint.org/docs)
- [Amazon Athena](https://docs.aws.amazon.com/cur/latest/userguide/cur-query-athena.html)
- [AWS Cost and Usage Reports](https://docs.aws.amazon.com/cur/latest/userguide/what-is-cur.html)

## **VARIABLES**
All variables are configured as EKS secrets of type Opaque

|Name| Description|
| :---: | :---: |
|AWS_DEFAULT_REGION|Region definition|
|AWS_ACCESS_KEY_ID|Billing account access key|
|AWS_SECRET_ACCESS_KEY|Billing account access secret|
|AWS_BILLING_ACCOUNT_ID|Billing account ID|
|AWS_BILLING_ACCOUNT_NAME|Billing account name|
|AWS_USE_BILLING_DATA|True or False|
|AWS_ATHENA_DB_NAME|Database name|
|AWS_ATHENA_DB_TABLE|Table name|
|AWS_ATHENA_QUERY_RESULT_LOCATION|Query destination S3|
|AWS_ATHENA_REGION|Athena region definition|
|CACHE_MODE|cache mode (MONGODB)|
|MONGODB_URI|URI mondodb access|

## **SCHEDULES**
Billing report generated once daily after midnight.

## **NOTIFICATION**

## **LANGUAGE**
opentofu

### **VERSION**
1.6.1

--------------------------

### Author(s)

**Name:** Diego Alves Dias

**E-mail:** dias.ti@outlook.com

**Date:** 25/04/2024

------------------------

### Collaboration(s)

**Name:**

**E-mail:**

**Date:**
