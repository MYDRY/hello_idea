# frozen_string_literal: true

class InvestsController < ApplicationController
  before_action :authorize, only: %i[create update]

  def create
    invested_topic = Topic.find(params[:topic_id])
    invests_amount = params[:invests_amount].to_i
    invest = current_user.invests.build(topic_id: invested_topic.id, amount: invests_amount)
    invest.save
    invested_topic.get_supported(invests_amount)
    current_user.change_point(-invests_amount)
    view_context.spawn_new_invest_notice(invested_topic, current_user, invests_amount)
    redirect_to invested_topic
  end

  def update
    invest = Invest.find(params[:id])
    additional_amount = params[:invests_amount].to_i
    if additional_amount != 0
      invest.amount += additional_amount
      invest.save
      invest.topic.get_supported(additional_amount)
      current_user.change_point(-additional_amount)
      view_context.spawn_new_invest_notice(invest.topic, current_user, additional_amount)
    end
    redirect_to invest.topic
  end
end
