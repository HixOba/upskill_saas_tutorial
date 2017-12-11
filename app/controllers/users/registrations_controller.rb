class Users::RegistrationsController < Devise::RegistrationsController
  before_action :select_plan, only: :new
  
  # Extend default Devise gem behaviour so that
  # users signing up with the Pro account (plan Id 2)
  # save with a special Stripe subscription function.
  # Otherwise Devise signs up user as usual (Basic account)
  def create
    super do |resource|
      if params[:plan]
        resource.plan_id = params[:plan] # Save user based on plan 1 or plan 2
        if resource.plan_id == 2
          resource.save_with_subscription # For Pro
        else
          resource.save # For Basic
        end  
      end  
    end
  end
  
  private
    def select_plan
      unless (params[:plain] == '1' || params[:plan] == '2')
        flash[:notice] = "Please select a membership plan to sign up!"
        redirect_to root_url
      end
    end  
end