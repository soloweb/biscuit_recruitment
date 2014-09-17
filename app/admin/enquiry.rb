ActiveAdmin.register Enquiry do
  actions :all, except: [:edit, :new, :destroy]
end