class ZebraController < ApplicationController

  def squareform
    render({ :template => "game_templates/square_form" })
  end  

  def calsquareresult
    @the_num = params.fetch("users_number").to_f
    @the_result = @the_num ** 2
    render({ :template => "game_templates/square_result" })
  end

  def squarerootform
    render({ :template => "game_templates/square_root_form" })
  end  

  def calsquarerootresult
    @the_num = params.fetch("users_number").to_f
    @the_result = @the_num ** 0.5    
    render({ :template => "game_templates/square_root_result" })
  end

  def randomform
    render({ :template => "game_templates/random_form" })
  end
  
  def calrandomresult
    @the_num_min = params.fetch("users_number_min").to_f
    @the_num_max = params.fetch("users_number_max").to_f
    @the_result = rand(@the_num_min..@the_num_max)
    render({ :template => "game_templates/random_result" })
  end

  def paymentform
    render({ :template => "game_templates/payment_form" })
  end    

  def calpaymentresult
    @the_num_apr_raw = params.fetch("user_apr").to_f
    @the_num_apr = @the_num_apr_raw / 100 / 12
    @the_num_period_raw = params.fetch("user_years").to_i
    @the_num_period = (@the_num_period_raw * 12).to_i
    @principal = params.fetch("user_pv").to_f
  
    @numerator = @the_num_apr * @principal * (1 + @the_num_apr) ** @the_num_period
    @denominator = (1 + @the_num_apr) ** @the_num_period - 1
  
    if @denominator != 0
      @the_result = (@numerator / @denominator).to_fs(:currency)
    else
      @the_result = (@principal / @the_num_period).to_fs(:currency)
    end
    
    @formatted_apr = @the_num_apr_raw.to_fs(:percentage, precision: 4)
    @formatted_principal = @principal.to_fs(:currency)
    render({ :template => "game_templates/payment_result" })  
  end

end  
