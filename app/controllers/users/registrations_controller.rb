class Users::RegistrationsController < Devise::RegistrationsController
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
end