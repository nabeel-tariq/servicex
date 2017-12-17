RailsAdmin.config do |config|

  ### Popular gems integration

  ## == Devise ==
  config.authenticate_with do
    warden.authenticate! scope: :admin
  end
  config.current_user_method(&:current_admin)
  ## == Cancan ==
  # config.authorize_with :cancan

  ## == Pundit ==
  # config.authorize_with :pundit

  ## == PaperTrail ==
  # config.audit_with :paper_trail, 'User', 'PaperTrail::Version' # PaperTrail >= 3.0.0

  ### More at https://github.com/sferik/rails_admin/wiki/Base-configuration

  ## == Gravatar integration ==
  ## To disable Gravatar integration in Navigation Bar set to false
  # config.show_gravatar = true


  config.model 'User' do
    list do
      field :id
      field :first_name
      field :last_name
      field :email
      field :is_active
    end

    edit do
      field :first_name
      field :last_name
      field :email
      field :is_active
    end
  end
  config.model 'Admin' do
    list do
      field :id
      field :email
      field :is_active
    end

    edit do
      field :email
      field :is_active do
        visible do
          bindings[:view]._current_user.id != bindings[:object].id
        end
      end
    end
  end

  config.model 'Bidding' do
    list do
      field :id
      field :job
      field :description
      field :status
      field :amount
      field :time
    end

    edit do
      field :job
      field :description
      field :status
      field :amount
      field :time
    end
  end
  config.model 'City' do
    list do
      field :id
      field :name
      field :state
    end

    edit do
      field :name
      field :state
    end
  end
  config.model 'ContactNumber' do
    list do
      field :id
      field :text_value
      field :contactable_type
      field :contactable
      field :status
      field :number_type
    end

    edit do
      field :text_value
      field :contactable_type
      field :contactable
      field :status
      field :number_type
    end
  end

  config.model 'Contractor' do
    list do
      field :id
      field :first_name
      field :last_name
      field :shop_name
      field :is_active
    end

    edit do
      field :first_name
      field :last_name
      field :shop_name
      field :is_active
    end
  end

  config.model 'Employer' do
    list do
      field :id
      field :first_name
      field :last_name
      field :is_active
    end

    edit do
      field :first_name
      field :last_name
      field :is_active
    end
  end

  config.model 'Job' do
    list do
      field :id
      field :name
      field :description
      field :status
      field :employer
      field :budget
      field :time
      field :ad_type
    end

    edit do
      field :name
      field :description
      field :status
      field :employer
      field :budget
      field :time
      field :ad_type
    end
  end

  config.model 'Location' do
    list do
      field :id
      field :name
      field :locationable_type
      field :locationable
      field :address_1
      field :address_2
      field :zip_code
      field :city
      field :state
    end

    edit do
      field :name
      field :locationable_type
      field :locationable
      field :address_1
      field :address_2
      field :zip_code
      field :city
      field :state
    end
  end

  config.model 'Order' do
    list do
      field :id
      field :job
      field :bidding
      field :status
      field :amount
      field :remarks
      field :ending_date
    end

    edit do
      field :job
      field :bidding
      field :status
      field :amount
      field :remarks
      field :ending_date
    end
  end

  config.model 'Payment' do
    list do
      field :id
      field :order
      field :status
    end
    edit do
      field :order
      field :status
    end
  end

  config.model 'Service' do
    list do
      field :id
      field :name
      field :service_category
      field :service_type
    end
    edit do
      field :name
      field :service_category
      field :service_type
    end
  end

  config.model 'ServiceCategory' do
    list do
      field :id
      field :category_name
      field :status
    end
    edit do
      field :category_name
      field :status
    end
  end

  config.model 'State' do
    list do
      field :id
      field :name
    end
    edit do
      field :name
    end
  end

  config.model 'Technician' do
    list do
      field :id
      field :first_name
      field :last_name
      field :is_active
      field :contractor
    end
    edit do
      field :first_name
      field :last_name
      field :is_active
      field :contractor
    end
  end

  config.model 'Question' do
    list do
      field :id
      field :title
      field :name
      field :question_type
      field :description
      field :answers
      field :status
    end
    edit do
      field :title
      field :name
      field :question_type
      field :description
      field :answers, :text do
        formatted_value do
          bindings[:object].values&.join("\r\n") || ""
        end
      end
      field :status
      field :services
    end
  end

  config.included_models = %w[ Question User Employer Contractor Job ContactNumber Bidding Order Service ServiceType City State Payment Admin Location ServiceCategory State Technician]
  config.actions do
    dashboard                     # mandatory
    index                         # mandatory
    new
    export
    bulk_delete
    show
    edit
    delete do
      except ['Admin', 'User']
    end
    show_in_app

    ## With an audit adapter, you can add:
    # history_index
    # history_show
  end
end
