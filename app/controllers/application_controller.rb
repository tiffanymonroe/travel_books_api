class ApplicationController < ActionController::API

  def authenticate_token
    puts "AUTHENTICATE JWT"
    #is the bearer_token the correct argument or does this need debugging?
    render json: { status: 401, message: 'Unauthorized' } unless decode_token(bearer_token)
  end

  def bearer_token
    puts "BEARER TOKEN"
    puts header = request.env["HTTP_AUTHORIZATION"]

    pattern = /^Bearer /
    puts "TOKEN WITHOUT BEARER"
    puts header.gsub(pattern, '') if header && header.match(pattern)
    # return header.gsub(pattern, '')
    header.gsub(pattern, '') if header && header.match(pattern)
  end

  def decode_token(token_input)
    puts "DECODE TOKEN, token input: #{token_input}"
    # this works renders get request in postman and rails s console w/decoded info
    #does there need to be a 5th argument after the algorithm?
    puts token = JWT.decode(token_input, ENV['JWT_SECRET'], true, { :algorithm => 'HS256' })
    # return token
    # this doesn't render decoded info in postman, but does still do so in rails s console
    JWT.decode(token_input, ENV['JWT_SECRET'], true, { :algorithm => 'HS256' })
  rescue
    render json: { status: 401, message: 'Unauthorized User, Get Out!!!' }
  end

  def get_current_user
    return if !bearer_token
    decoded_jwt = decode_token(bearer_token)
    User.find(decoded_jwt[0]["user"]["id"])
  end

  def show
    render json: get_current_user
  end

#think this goes here & not the user contoller, wasn't explicit in the markdown
  def authorize_user
    puts "AUTHORIZE USER"
    puts "user id: #{get_current_user.id}"
    puts "params: #{params[:id]}"
    render json: { status: 401, message: 'Unauthorized' } unless get_current_user.id == params[:id].to_i
  end


end
