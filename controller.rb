require 'sinatra'
require 'sinatra/contrib/all' if development?
require "pry-byebug"

# get '/multiply/:x/:y' do
#   result = params[:x].to_f * params[:y].to_f
#   "#{params[:x]} times #{params[:y]} is #{result}"
# end

# get '/multiply/:x/:y' do |x, y|
#   @result = x.to_f * y.to_f
#   erb :result
# end

get '/' do
  @first = params[:first].to_f
  @second = params[:second].to_f
  @operator = params[:operator]

  @result = case @operator
    when '+' then @first + @second
    when '-' then @first - @second
    when '*' then @first * @second
    when '/' then 
      if @second != 0
        @first / @second
      else
        'infinity'
      end
  end

  @first = convert(@first)
  @second = convert(@second)
  @result = convert(@result)

  @operator_string = case @operator
    when '+' then 'plus'
    when '-' then 'minus'
    when '*' then 'times'
    when '/' then 'divided by'
  end
  
  erb :result
end

def convert(float)
  if float == float.to_i
    float.to_i
  else
    float
  end
end



get '/about_us' do
  erb :about_us
end

get '/contact_us' do

  # binding.pry
  @name = params[:name]
  @email = params[:email]
  @message = params[:message]

  @first_name = @name.split[0] if @name

  erb :contact_us
end












