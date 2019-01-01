# frozen_string_literal: true

module InvestsHelper
  def calc_invest_rates(topic)
    total = topic.support
    invests = Invest.where(topic_id: topic.id)
    results = []
    invests.each do |invest|
      results << { user_id: invest.user_id,
                   rate:    invest.amount / total.to_f }
    end
    results
  end
end
