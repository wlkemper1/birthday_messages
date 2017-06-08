class FriendsController < ApplicationController
  def index
    @friends = Friend.all

    render("friends/index.html.erb")
  end

  def show
    @friend = Friend.find(params[:id])

    render("friends/show.html.erb")
  end

  def new
    @friend = Friend.new

    render("friends/new.html.erb")
  end

  def create
    @friend = Friend.new

    @friend.date = params[:date]
    @friend.email = params[:email]
    @friend.user_id = params[:user_id]
    @friend.birthday = params[:birthday]
    @friend.friend_name = params[:friend_name]
    @friend.email_subject = params[:email_subject]
    @friend.email_body = params[:email_body]

    save_status = @friend.save

    if save_status == true
      redirect_to("/friends/#{@friend.id}", :notice => "Friend created successfully.")
    else
      render("friends/new.html.erb")
    end
  end

  def edit
    @friend = Friend.find(params[:id])

    render("friends/edit.html.erb")
  end

  def update
    @friend = Friend.find(params[:id])

    @friend.date = params[:date]
    @friend.email = params[:email]
    @friend.user_id = params[:user_id]
    @friend.birthday = params[:birthday]
    @friend.friend_name = params[:friend_name]
    @friend.email_subject = params[:email_subject]
    @friend.email_body = params[:email_body]

    save_status = @friend.save

    if save_status == true
      redirect_to("/friends/#{@friend.id}", :notice => "Friend updated successfully.")
    else
      render("friends/edit.html.erb")
    end
  end

  def destroy
    @friend = Friend.find(params[:id])

    @friend.destroy

    if URI(request.referer).path == "/friends/#{@friend.id}"
      redirect_to("/", :notice => "Friend deleted.")
    else
      redirect_to(:back, :notice => "Friend deleted.")
    end
  end
end
