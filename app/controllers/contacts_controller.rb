class ContactsController < ApplicationController
  skip_before_action :authenticate_user!

  def new
    @contact = Contact.new
  end

  def create
    @contact = Contact.new(params[:contact])
    @contact.request = request
    if @contact.deliver
      flash.now[:success] = 'Mensaje enviado. En breve nos pondremos en contacto contigo.'
    else
      flash.now[:error] = 'No pudo enviarse el mensaje. Compruebe que ha completado todos los datos correctamente.'
      render :new
    end
  end
end
