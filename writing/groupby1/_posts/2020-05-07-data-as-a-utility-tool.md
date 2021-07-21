---
layout: post
title: Data as a Utility Tool
date: '2020-05-07 09:17:00'
excerpt: "Within the companies I have worked for and plan on working for, uncertainty is a common thread. Sales may continue to accelerate, funding should land next quarter, we hope to keep in touch. The uncertainty may be more concrete. We should change to a new CRM. We probably need to stop reporting in Excel. ."
exclude: false
tags:
- Data
- Data Systems
- Top Post
blog:
- group by 1
---
_Welcome to **group by 1**. In this first post, I’ve started broad with my opinion on a few of the typical compromises made when implementing a modern data warehouse solution. Modern meaning cloud, data warehouse meaning the back-end for an analytics tool. This post is a primer for my future content._

<div>

* * *

</div>

[![](https://bucketeer-e05bbc84-baa3-437e-9518-adb32be77984.s3.amazonaws.com/public/images/5fc281e7-c1f3-4813-b538-aacd2cda2764_2914x1943.jpeg) <style>a.image2.image-link.image2-971-1456 { padding-bottom: 66.68956043956044%; padding-bottom: min(66.68956043956044%, 971px); width: 100%; height: 0; } a.image2.image-link.image2-971-1456 img { max-width: 1456px; max-height: 971px; }</style>](https://cdn.substack.com/image/fetch/c_limit,f_auto,q_auto:good,fl_progressive:steep/https%3A%2F%2Fbucketeer-e05bbc84-baa3-437e-9518-adb32be77984.s3.amazonaws.com%2Fpublic%2Fimages%2F5fc281e7-c1f3-4813-b538-aacd2cda2764_2914x1943.jpeg)

Within the companies I have worked for and plan on working for, uncertainty is a common thread. Sales _may_ continue to accelerate, funding _should_ land next quarter, we _hope_ to keep in touch. The uncertainty may be more concrete. We _should_ change to a new CRM. We _probably_ need to stop reporting in Excel. 

I’ve put together some opinions on what has worked for me in managing uncertainty when architecting data systems that need to cater for many parallel futures.

### Two Buckets

Designing solutions for analytics systems can stylistically or abstractly be described as a problem of two buckets. Bucket one is full of the typical problems a business might have. The business usually then approaches “the data team” with problems such as **help us define a metric / store the data / visualise the KPI / distribute the report**.

In this simplistic utopia, bucket two, the Solutions Bucket, is typically filled with lots of products and opinions, like **Snowflake / Big Query / my last company used Tableau / group by 1** etc.

    select * from problems_bucket
       inner join (select * from solutions_bucket) 

[![](https://bucketeer-e05bbc84-baa3-437e-9518-adb32be77984.s3.amazonaws.com/public/images/465b1ebb-a438-4537-b2e9-3aedf405bcf6_410x259.png) <style>a.image2.image-link.image2-333-526 { padding-bottom: 63.170731707317074%; padding-bottom: min(63.170731707317074%, 332.2780487804878px); width: 100%; height: 0; } a.image2.image-link.image2-333-526 img { max-width: 526px; max-height: 332.2780487804878px; }</style>](https://cdn.substack.com/image/fetch/c_limit,f_auto,q_auto:good,fl_progressive:steep/https%3A%2F%2Fbucketeer-e05bbc84-baa3-437e-9518-adb32be77984.s3.amazonaws.com%2Fpublic%2Fimages%2F465b1ebb-a438-4537-b2e9-3aedf405bcf6_410x259.png)

The catch when architecting a solution is that you’re _**given only one scoop**_ from the solution bucket, with the hope that it covers as many of the items in the problem bucket as possible. The solution bucket is usually very resource-intensive, expensive, time-consuming and gathers momentum once that scoop is moving.

The decision to re-scoop is not going to be taken lightly. The first scoop usually needs to be made under significant uncertainty and pressure. This is a time to be making bets that will serve you in many of your uncertain futures.

### Travel Light

For this reason, I invoke the spirit of a prepper, where travelling light is as essential as being prepared. Enter the Swiss army knife.

My ideal scoop of the solution bucket, like a good utility tool, has a nice healthy mix of scalability, ease of use, and utilitarian functionality. Bare metal that stands the test of time and rests easily on the hip, ready for action!

More concretely, a lightweight data architecture describes modularity, where each component plays a specified part in the greater whole, without restricting the system. This enables upgrading, downgrading and replacing as necessary. 

With that in mind, I’ll be describing _my opinion / experience / preference_ for a utilitarian data architecture.

### Context

The context of this article skews heavily to the typical **first-hired-one-person-data-team** scenario and is generally applicable if that person is within a small business, a startup or a small team within a larger organisation. It can be extended to a data team within a larger organisation that is rethinking their architecture. 

New paradigms start from the ground up, and so it can safely be assumed that this paradigm will be what banks implement in 50 years while the rest of us use quantum computing to think the data into order.

The driver for this workflow arises from the need to centralise data across multiple systems, typically at the point where there are 3+ key business apps or systems. 

If you're the one called in to take over from the last guy who burnt the ETL (extract-transform-load) candle on both ends and now has a 1000 yard stare, then this might hit a nerve.

**Ingesting, Storing, Transforming, Distributing**. Four verbs for four (4) sections that describe what will be covered, and the order.

### 1\. Ingesting

I generally subscribe to the opinion that engineers should avoid writing custom ETL code whenever practically possible, and rather use a managed SaaS ETL tool. This resembles the corkscrew of our Swiss army knife. Powerful and simple.

Managed ETL tools allow you to connect to your supported sources, point those at your data warehouse and have data flowing in a matter of minutes. You are paying for specialisation here. Post-implementation, the ETL specialist at the end of an intercom is worth their (initially) nominal fee.

[![](https://bucketeer-e05bbc84-baa3-437e-9518-adb32be77984.s3.amazonaws.com/public/images/70020299-3b46-402c-b41e-4de0e3867437_500x333.png) <style>a.image2.image-link.image2-333-500 { padding-bottom: 66.60000000000001%; padding-bottom: min(66.60000000000001%, 333px); width: 100%; height: 0; } a.image2.image-link.image2-333-500 img { max-width: 500px; max-height: 333px; }</style>](https://cdn.substack.com/image/fetch/c_limit,f_auto,q_auto:good,fl_progressive:steep/https%3A%2F%2Fbucketeer-e05bbc84-baa3-437e-9518-adb32be77984.s3.amazonaws.com%2Fpublic%2Fimages%2F70020299-3b46-402c-b41e-4de0e3867437_500x333.png)

If you cannot get your data into your data warehouse with a managed ETL, or you cannot strike the cost/benefit balance, then you’ll have to start building. This is a great time to think about the possibility of contracting the work to a specialist. They’ll bring the expertise, and over time you can consider internalising that skill as you see fit. Because the work is narrowly described and easily measured, this is a great piece of work for outsourcing. Budget for a maintenance contract, and keep an eye on those Managed ETL services as a replacement option over time.

Some additional thoughts:

*   Ingesting raw data (JSON or tables) into your data warehouse is key. Don’t spend time at this point doing transforms in python, there isn’t time. ETL has been surpassed by ELT (extract-load-transform). This new paradigm is now established.

*   A Google sheet is a data source. Time is of the essence and done is better than perfect. Data validation, spreadsheet protection and read-only permissions _do a database maketh_. Use this one sparingly, as word may get out.

### 2\. Storing

Balancing the trifecta of scalability, cost and performance is key when picking the backbone of your system. Your data may start small, or large, or small with a risk of growing large. Stopping to change a tire in bear country is never a good look, and neither is a data warehouse migration.

Managed data warehouses balance the trifecta, with scalability from a team of 1 to 100(n), megabytes to terabytes+, cost starting near zero, and performance flexibility to suit your budget and need.

[![](https://bucketeer-e05bbc84-baa3-437e-9518-adb32be77984.s3.amazonaws.com/public/images/05e61e78-d226-44c8-a58b-de561533e6c2_5472x3648.jpeg) <style>a.image2.image-link.image2-337-504 { padding-bottom: 66.68956043956045%; padding-bottom: min(66.68956043956045%, 336.11538461538464px); width: 100%; height: 0; } a.image2.image-link.image2-337-504 img { max-width: 504px; max-height: 336.11538461538464px; }</style>](https://cdn.substack.com/image/fetch/c_limit,f_auto,q_auto:good,fl_progressive:steep/https%3A%2F%2Fbucketeer-e05bbc84-baa3-437e-9518-adb32be77984.s3.amazonaws.com%2Fpublic%2Fimages%2F05e61e78-d226-44c8-a58b-de561533e6c2_5472x3648.jpeg)

Your contract for a data warehouse should begin near $0 and go up from there. Start negotiating your unit costs down once the value of the contract becomes significant, or sooner. The point is that you can get started, prove value, and iron out the details down the line.

Snowflake is a good start, Big Query does wonders. Microsoft is probably up to something with Azure. Redshift is squarely in the **`migrated_from`** category. All can scale beyond your VC backer's wildest dreams.

This is the knife of your Swiss army knife, simply put, a knife needs to be sharp, a data warehouse needs to be powerful. The main attraction.

### 3\. Transforming

Pliers apply leverage. A Swiss army knife doesn’t have pliers, which is why no one owns one, preferring a utility-tool. Loosely applying the same logic, the Transformation Layer has long been the missing link in the analytics stack, with various frustrating attempts at enabling elegant management of transformations. 

[![](https://bucketeer-e05bbc84-baa3-437e-9518-adb32be77984.s3.amazonaws.com/public/images/02752614-89fb-4bc7-9720-ce2329e640b6_6240x4160.jpeg) <style>a.image2.image-link.image2-347-520 { padding-bottom: 66.68956043956044%; padding-bottom: min(66.68956043956044%, 346.7857142857143px); width: 100%; height: 0; } a.image2.image-link.image2-347-520 img { max-width: 520px; max-height: 346.7857142857143px; }</style>](https://cdn.substack.com/image/fetch/c_limit,f_auto,q_auto:good,fl_progressive:steep/https%3A%2F%2Fbucketeer-e05bbc84-baa3-437e-9518-adb32be77984.s3.amazonaws.com%2Fpublic%2Fimages%2F02752614-89fb-4bc7-9720-ce2329e640b6_6240x4160.jpeg)

The broad goal here is to enable access to your data for your business users while abstracting away as much of the source system complexity as possible. The outcome is clean, documented, coherent, reliable, logical, self-explanatory and performant data that can be relied upon by the **Distributing** tools. This is the highest leverage point in your pipeline. Leverage that magnifies both gains and mistakes.

SQL is the language of analysis, and a collection of SQL scripts best describes the transformation of data landed **`RAW`** in your data warehouse to ultimately transformed and ready for **`ANALYTICS`**. The Analytics mentioned here is the schema that you expose to your **Distributing** tools.

[Dataform](https://dataform.co/?utm_source=groupby1.substack.com) is a tool that takes that simple concept and runs with it, making writing sophisticated transformations a delight for analysts. Simply explained, Dataform is a SQL editor that enables analysts to build complex transformations in a way that is maintainable and interpretable. Dataform is differentiated by three concepts from software engineering that are put in the hands of the analyst: 

**1/ Continuous Deployment**

A deployment of new code or changes to your transforms should be a thing that happens continuously, and without fear. This is achieved through automated schema tests, continuously deploying code, and data validity and quality tests. This is achieved through the **`assertions`** in Dataform, among other useful features.

**2/ Version Control**

If your job involves writing SQL code, and doesn't involve version control, then perhaps more than anything else, this article was written for you.

**3/ Modularity**

If your SQL queries typically run into the 100's or 1000's of lines, with sub-queries galore, then breaking that into individual reusable modular components will feel like our man on a rock below. Extend this with JavaScript and suddenly you will be able to _truly_ _express yourself._

[![](https://bucketeer-e05bbc84-baa3-437e-9518-adb32be77984.s3.amazonaws.com/public/images/2dc8effc-17e2-494a-9500-e300f9df28fe_6354x4236.jpeg) <style>a.image2.image-link.image2-333-498 { padding-bottom: 66.68956043956044%; padding-bottom: min(66.68956043956044%, 332.114010989011px); width: 100%; height: 0; } a.image2.image-link.image2-333-498 img { max-width: 498px; max-height: 332.114010989011px; }</style>](https://cdn.substack.com/image/fetch/c_limit,f_auto,q_auto:good,fl_progressive:steep/https%3A%2F%2Fbucketeer-e05bbc84-baa3-437e-9518-adb32be77984.s3.amazonaws.com%2Fpublic%2Fimages%2F2dc8effc-17e2-494a-9500-e300f9df28fe_6354x4236.jpeg)

### 4\. Distributing

`### TODO - setup a BI tool`

Distribution of data. Commonly described as an Analytics Tool or BI tool aka _The Last Mile delivery problem._

In a physical product, and an analytics project, the **last mile of delivery** is often both the most expensive and time-consuming part of the delivery mechanism. This is the point where the surface area expands massively, and the usage pattern permutations explode. Bluntly; the neatly organised cookie-cutter data pipeline gets punched in the face by the needs of the user.

The utility-tool analogy falls apart somewhat at this point, as arguably the pliers should be used here. Just like [this](https://www.leatherman.com/tread-425.html) utility-tool, it can get a bit confusing.

Broadly speaking the distribution problem gets broken into two categories. BI tools and Analytics Tools. The distinction is murky, like your requirements. Generally speaking, these tools are either:

**1/** Good at solving the operational reporting problems of business: Metrics, KPIs, lots of users, lots of operational complexity (tools like Looker, [Metabase](https://metabase.com/?utm_source=groupby1.substack.com)).

**2/** Good at solving the analysts’ problems: complicated questions, nuanced analysis, vague outcomes, forecasts, predictions (tools like Mode, Periscope, Jupyter Notebooks).

A rule of thumb is that you need a good few _business users_ who are comfortable writing complicated SQL or Python before Option 2 will be feasible. This decision is largely based on the operational complexity and technical fluency of the stakeholders in this grand adventure, and generally Option 1 is more broadly applicable.

If you’ve done good work in your **Transforming** layer, then you can get away with a compromise here, and use a cheaper tool as a stop-gap, or use an array of tools, or allow the team to choose whatever suits them. Ultimately, you want to trend towards a single source of truth for KPI / Metric type numbers, and aim to automate their delivery.

### My experience

I've honed in on my preferred data stack, described below. This stack is likely a feasible option for your goals if they are related to aligning your business on key metrics. Especially so if you have multiple SaaS or custom software systems floating around that drive these metrics. What you’ll end up with is something like the following diagram.

[![](https://bucketeer-e05bbc84-baa3-437e-9518-adb32be77984.s3.amazonaws.com/public/images/e0996748-9c20-4b96-a212-264c33e4ca9e_1600x1004.png) <style>a.image2.image-link.image2-350-556 { padding-bottom: 62.77472527472527%; padding-bottom: min(62.77472527472527%, 349.0274725274725px); width: 100%; height: 0; } a.image2.image-link.image2-350-556 img { max-width: 556px; max-height: 349.0274725274725px; }</style>](https://cdn.substack.com/image/fetch/c_limit,f_auto,q_auto:good,fl_progressive:steep/https%3A%2F%2Fbucketeer-e05bbc84-baa3-437e-9518-adb32be77984.s3.amazonaws.com%2Fpublic%2Fimages%2Fe0996748-9c20-4b96-a212-264c33e4ca9e_1600x1004.png)

**Ingesting/** As mentioned, I prefer to use a SaaS ELT tool like [Stitch](https://www.stitchdata.com/?utm_source=groupby1.substack.com) or [Fivetran](https://www.fivetran.com/?utm_source=groupby1.substack.com), as they reduce the need for ongoing maintenance where possible. Stitch is the cheaper option, and a great low-cost starting point, with the following useful additions:

*   It has a great [Import API](https://www.stitchdata.com/integrations/import-api/?utm_source=groupby1.substack.com) that allows some simplification of ELT scripts if you do need to write them.

*   It has a useful [Google Sheets](https://www.stitchdata.com/integrations/google-sheets/?utm_source=groupby1.substack.com) Integration, as well as the usual Postgres, Hubspot, Salesforce, Google/Facebook ads etc.

**Storing/** The stack described orients towards [BigQuery](https://cloud.google.com/bigquery/?utm_source=groupby1.substack.com) or [Snowflake](https://snowflake.com/?utm_source=groupby1.substack.com), with PostgreSQL also a feasible option. I prefer the scale / cost model of Snowflake.

*   Snowflake scales up to enterprise but starts from $2/credit, so can be a very cost-effective bet with typical small loads running around 2-5 credits per day. This can get very expensive if you don’t manage it carefully with limits.

*   PostgreSQL will require a migration in the future, so unless you are very cost sensitive, the cost / benefit generally leans in favour of Snowflake.

*   I have a [simple SQL script](https://github.com/mattarderne/snowflake_init/blob/master/first_run.sql) used to setup Snowflake ready to use for a POC, and I like to use [these](https://github.com/snowflakedb/SnowAlert/blob/master/packs/snowflake_query_pack.sql) [scripts](https://github.com/snowflakedb/SnowAlert/blob/master/packs/snowflake_cost_management.sql) to track Snowflake credit usage in combination with Dataform assertions.

**Distributing/** This is where business users will interact with and judge the success of your system, so to spend your budget on the rest of the components but cut corners on the distribution tool is a bad idea. That said, BI tools can have expensive annual contracts.

*   [Metabase](https://metabase.com/?utm_source=groupby1.substack.com) is a great open-source BI tool and should give you a good place to start. The cost jump is quite severe up to [Looker](https://looker.com/?utm_source=groupby1.substack.com) / [ChartIO](https://chartio.com/?utm_source=groupby1.substack.com), but so is the feature set.

*   These tools are trickier to migrate from, and so it is reasonable to expect to be locked-in for the mid-term.

**Transforming/** This may be premature depending on the level of sophistication of logical transformations required to answer your questions, but at some stage it will make sense to move your transforms to the data warehouse from the BI tool. 

*   The best of breed at this stage is [Dataform](https://dataform.co/?utm_source=groupby1.substack.com) or [dbt.](https://www.getdbt.com/?utm_source=groupby1.substack.com) These tools enable software development best practices (git, testing, documentation).

*   There is relatively little involved in adding this from the start, and significant gains to be had if used to build a logical data model from the start.

*   I have deployed Metabase successfully with https and nice scalability using [these Docker scripts](https://github.com/mattarderne/metabase).

In future editions I’ll be diving into the above specifics, stay tuned.

### Conclusion

Taking the time to properly implement a reasoned and scalable analytics infrastructure is an axe sharpening exercise with benefits that may compound massively over time. Second-order benefits to aim for include increasing the data proficiency of your team, enabling evidence-based decision making and most importantly, increasing alignment.

Most businesses follow similar patterns, and in survival as in business, preparation is key.

[![https://images.unsplash.com/photo-1545476745-9211a9e7cca8?ixlib=rb-1.2.1&q=85&fm=jpg&crop=entropy&cs=srgb](https://bucketeer-e05bbc84-baa3-437e-9518-adb32be77984.s3.amazonaws.com/public/images/ccaa6be0-683a-4961-abe6-abec07d6018b_1600x1068.jpeg) <style>a.image2.image-link.image2-972-1456 { padding-bottom: 66.75824175824175%; padding-bottom: min(66.75824175824175%, 972px); width: 100%; height: 0; } a.image2.image-link.image2-972-1456 img { max-width: 1456px; max-height: 972px; }</style>](https://cdn.substack.com/image/fetch/c_limit,f_auto,q_auto:good,fl_progressive:steep/https%3A%2F%2Fbucketeer-e05bbc84-baa3-437e-9518-adb32be77984.s3.amazonaws.com%2Fpublic%2Fimages%2Fccaa6be0-683a-4961-abe6-abec07d6018b_1600x1068.jpeg)

> “Give me six hours to chop down a tree and I will spend the first four sharpening the axe.” - Abe

<div>

* * *

</div>

_Please consider subscribing for more on the subject of data systems thinking_

[<span>Subscribe now</span>](https://groupby1.substack.com/subscribe?)

_What is [group by 1](https://groupby1.substack.com/about)_

_Who is [Matt Arderne](https://rdrn.dev/?utm_source=groupby1.substack.com)_