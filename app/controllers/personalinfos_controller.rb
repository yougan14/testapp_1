class PersonalinfosController < ApplicationController
  def show
    @personalinfos = Personalinfo.find(params[:id])
  end

  def index
    @personalinfos = Personalinfo.all
    @personalinfos = Personalinfo.order("created_at DESC")

    respond_to do |format|
      format.html
      format.xlsx {
        response.headers["Content-Disposition"] = 'attachment; filename="all_personailinfos.xlsx"'
      }
    end
  end

  def new
    @personalinfo = Personalinfo.new
  end

  def create
    @personalinfo = Personalinfo.new(params.require(:personalinfo).permit(:name, :date_of_birth,
                                                                          :gender, :blood_group, :email, :mobile_number, :address, :state, :country))
    @personalinfo.save
    if @personalinfo.save
      flash[:notice] = "Infomation was created successfully."
      redirect_to @personalinfo
    else
      render "new"
    end
  end

  def destroy
    @personalinfo = Personalinfo.find(params[:id])
    @personalinfo.destroy
    redirect_to personalinfos_path
  end

  def edit
    @personalinfo = Personalinfo.find(params[:id])
  end

  def update
    @personalinfo = Personalinfo.find(params[:id])
    if @personalinfo.update(params.require(:personalinfo).permit(:name, :date_of_birth, :gender, :blood_group, :email, :mobile_number, :address, :state, :country))
      flash[:notice] = "Personal information was updated successfully."
      redirect_to @personalinfo
    else
      render "edit"
    end
  end
end
