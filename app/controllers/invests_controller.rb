# frozen_string_literal: true

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

  def update
    invest = Invest.find(params[:id])
    additional_amount = params[:invests_amount].to_i
    invest.amount += additional_amount
    invest.save
    invest.topic.get_supported(additional_amount)
    current_user.change_point(-additional_amount)
    redirect_to invest.topic
  end
end
