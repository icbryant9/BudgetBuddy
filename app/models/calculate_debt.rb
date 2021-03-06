# == Schema Information
#
# Table name: calculate_debts
#
#  id                 :bigint           not null, primary key
#  compounds_per_year :integer
#  email              :string
#  monthly_payements  :decimal(, )
#  number_of_year     :decimal(, )
#  principle          :decimal(, )
#  rate               :decimal(, )
#  select             :integer
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#
class CalculateDebt < ApplicationRecord
    before_save :select_action
    validates :principle, numericality: {greater_than_or_equal_to: 0}
    validates :monthly_payements, numericality: {greater_than_or_equal_to: 0}
    validates :rate, numericality: {greater_than_or_equal_to: 0}

    def select_action
       
        trate = self.rate * 0.01

        if self.select == 2  #find monthly payments  ['select','Principle', 'Monthly Payements']
                r_and_k = trate/self.compounds_per_year #r/k
                r_and_k_plus = 1 + r_and_k #1 + r/k
            
            
                years =  -self.number_of_year #-n
                n_times_k = years * self.compounds_per_year #-nk
        
                inside = r_and_k_plus**n_times_k #(1+r/k)^-nk
                minus = 1-inside #(1-(1+r/k)^-nk)
                sum = minus / r_and_k 
                sum = sum/ self.principle
                sum = 1/sum 
                
                self.monthly_payements = sum.round(2)

        elsif self.select == 1 #find principle
            
                r_and_k = trate/self.compounds_per_year #r/k
                r_and_k_plus = 1 + r_and_k #1 + r/k
                
                
                years =  -self.number_of_year #-n
                n_times_k = years * self.compounds_per_year #-nk

                inside = r_and_k_plus**n_times_k

                minus = 1-inside

                sum = self.monthly_payements * minus

                sum = sum /r_and_k
                self.principle = sum.round(2)

        

        elsif self.select == 3 #find Year
            dk = self.monthly_payements * self.compounds_per_year #d*k

            dkr = dk / trate # d*k/r
            xminusdkr = self.principle - dkr #x - dkr

            x = ((-(trate * xminusdkr)/dk))

            x = Math.log(x)

            another = (trate/self.compounds_per_year) + 1
            a = self.compounds_per_year * Math.log(another)
            x = (-(x/a))

            
            self.number_of_year = x.round



        end
    end

    def calculate_monthly_payements
        trate = self.rate *0.01
        r_and_k = trate/self.compounds_per_year #r/k
        r_and_k_plus = 1 + r_and_k #1 + r/k
       
       
        years =  -self.number_of_year #-n
        n_times_k = years * self.compounds_per_year #-nk
 
        inside = r_and_k_plus**n_times_k #(1+r/k)^-nk
        minus = 1-inside #(1-(1+r/k)^-nk)
        sum = minus / r_and_k 
        sum = sum/ self.principle
        sum = 1/sum 
        
        self.monthly_payements = sum.round(2)

    end
    
    def calculate_principle
       trate = self.rate *0.01
       r_and_k = trate/self.compounds_per_year #r/k
       r_and_k_plus = 1 + r_and_k #1 + r/k
      
      
       years =  -self.number_of_year #-n
       n_times_k = years * self.compounds_per_year #-nk

       inside = r_and_k_plus**n_times_k

       minus = 1-inside

       sum = self.monthly_payements * minus

       sum = sum /r_and_k
       self.principle = sum.round(2)
    end
end
