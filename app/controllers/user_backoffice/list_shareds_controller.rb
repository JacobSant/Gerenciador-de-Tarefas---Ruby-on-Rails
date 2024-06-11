class UserBackoffice::ListSharedsController < LayoutUserController
  before_action :set_user_backoffice_list_shared, only: %i[ show ]

  # GET /user_backoffice/list_shareds or /user_backoffice/list_shareds.json
  def index
    @user_backoffice_tasks = []
    @shared_with_user = current_user.user_backoffice_list_shareds
    @shared_with_user.each do |description_shared|
      task = UserBackoffice::Task.find_by(id: description_shared.user_backoffice_task_id)
      if task.status == "Não concluída"
        shared_with_task = []
        UserBackoffice::ListShared.where(user_backoffice_task_id: description_shared.user_backoffice_task_id).each do |shared_task|
          shared_with_task.push(User.find_by(id: shared_task.user_id))
        end
        @user_backoffice_tasks.push([task, shared_with_task, User.find_by(id: task.user_id)])
      end
    end
  end

 
  # POST /user_backoffice/list_shareds or /user_backoffice/list_shareds.json
  
  # PATCH/PUT /user_backoffice/list_shareds/1 or /user_backoffice/list_shareds/1.json
  
  # DELETE /user_backoffice/list_shareds/1 or /user_backoffice/list_shareds/1.json


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user_backoffice_list_shared
      @user_backoffice_list_shared = UserBackoffice::ListShared.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def user_backoffice_list_shared_params
      params.require(:user_backoffice_list_shared).permit(:task_id, :user_id)
    end
end
