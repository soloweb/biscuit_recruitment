Given(/^There is a blog post$/) do
  @blog_post = Fabricate(:blog_post)
end

Given(/^I visit the blog posts show page$/) do
  visit 'blog/test-blog-post'
end

Then(/^I should see the blog posts content$/) do
  expect(page).to have_content 'This is a test blog post.'
end

Given(/^I visit the blog post index page$/) do
  visit '/blog'
end

Then(/^I should see the blog posts title$/) do
  expect(page).to have_content 'Test Blog Post'
end