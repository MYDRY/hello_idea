class InvestsController < ApplicationController
  def create
    invested_topic = Topic.find(params[:topic_id])
    invests_amount = params[:invests_amount].to_i
    # redirect_to invested_topic if invests_amount == 0
    invest = current_user.invests.build(topic_id: invested_topic.id, amount: invests_amount)
    invest.save
    invested_topic.get_supported(invests_amount)
    current_user.change_point(-invests_amount)
    redirect_to invested_topic
  end

  def edit
  end
end
