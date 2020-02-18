# About Project Hop documentation

The hop documentation project consists of multiple types of documentation. Each with their own purpose.

## Hop user manual
The user manual contains general guidelines and info for starting hop users and reference material about actions and transforms for the more advanced users.
It will contain Frequently Asked Questions and step by step samples

## Hop Tech manual
This reference guide will contain reference architectures and more advanced configuration and set-ups using HOP

# Build
## Tools used

For the website build Antora is used to generate the documents.

We also generate a pdf-book using a Asciidoctor maven project.

## Website
The content in this repository is used to generate the website [User Manual](https://www.project-hop.org/manual/latest/) and [Technical Documentation](https://www.project-hop.org/tech-manual/latest/) each commit in master triggers a jenkins build that pushes the latest changes to the website. Testing the website version before deployment is currently not possible

## PDF Book
The same content is used to generate a book version of the manual that can be downloaded or distributed with the installation of hop (currently under discussion)

The book can be generated using maven.

```
mvn clean install
```

The final result can be found in following location:

hop-user/tech-manual/modules/asciidoctor/target/generated-docs


# Contributing

## Changing existing content

1. create a fork of our repository
2. update a page
3. check if book lay-out does not break
4. create pull request

## Adding a new page

When creating a new page following must be taken into account:
* add your new page to nav.adoc
* add your new page to asciidoctor index.adoc
* when using xref to link to other Antora pages add a tag website-links[]

For more information take a look at our [Contribution Guide](https://www.project-hop.org/community/contributing/) or feel free to ask us question on our [Chat](https://chat.project-hop.org)