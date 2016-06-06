class ContactsController < ApplicationController
  before_action :set_contact, only: [:edit, :update, :destroy]
  
  def index
    @contacts = Contact.all
  end

  def new
   if params[:back]
      @contact = Contact.new(contacts_params)
    else
      @contact = Contact.new
   end
  end

  def create
    @contact = Contact.new(contacts_params)
    if @contact.save
     redirect_to contacts_path, notice: "お問い合わせを作成しました！"
     NoticeMailer.sendmail_contact(@contact).deliver
    else
      render action: 'new'
    end
  end
  
  def edit
    @contact = Contact.find(params[:id])
  end

  def update
      @contact = Contact.find(params[:id])
    if @contact.update(contacts_params)
      redirect_to contacts_path, notice: "更新しました！"
    else
      render action: 'edit'
    end
  end

  def destroy
    @contact = Contact.find(params[:id])
    @contact.destroy
    redirect_to contacts_path, notice: "削除しました！"
  end
  
  def confirm
    @contact = Contact.new(contacts_params)
    render :new if @contact.invalid?
  end
  
   private
    def contacts_params
      params.require(:contact).permit(:name, :email, :content)
    end

    def set_contact
      @contact = Contact.find(params[:id])
    end
end