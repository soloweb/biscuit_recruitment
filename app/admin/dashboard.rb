ActiveAdmin.register_page "Dashboard" do

  menu priority: 1, label: proc{ I18n.t("active_admin.dashboard") }

  content title: proc{ I18n.t("active_admin.dashboard") } do
    columns do
      column do
        panel "Recent Applications" do
          table_for VacancyApplication.order('created_at desc').limit(5) do
            column("Applicant Title")   {|application| application.title } 
            column("Applicant Name")   {|application| application.applicant_full_name } 
            column("Applicant Email")   {|application| application.applicant_email }
            column("Created at")   {|application| application.created_at }
            column("Vacancy")   {|application| application.vacancy ? link_to(application.vacancy.title, admin_vacancy_path(application.vacancy)) : 'Vacancy no longer exists' }
            column("")   {|application| link_to("View", admin_vacancy_application_path(application)) }
          end
        end
          text_node %{<a href=#{new_admin_vacancy_path} class="custom_action_button">Create Vacancy</a>}.html_safe
          text_node %{<a href=#{new_admin_admin_user_path} class="custom_action_button">Create Admin User</a>}.html_safe
      end

      column do
        panel "Recent Newsletter Subscribers" do
          table_for NewsletterSubscriber.order('created_at desc').limit(5) do
            column("Subscriber Email")   {|subscriber| subscriber.email } 
            column("Created at")   {|subscriber| subscriber.created_at }
            column("")   {|subscriber| link_to("View", admin_newsletter_subscriber_path(subscriber)) }
          end
        end
      end
    end
  end # content
end
