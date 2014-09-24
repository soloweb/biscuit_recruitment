Feature: Blog post functionality

Scenario: Viewing a blog post
Given There is a blog post
And I visit the blog posts show page
Then I should see the blog posts content

Scenario: Listing a blog post
Given There is a blog post
And I visit the blog post index page
Then I should see the blog posts title