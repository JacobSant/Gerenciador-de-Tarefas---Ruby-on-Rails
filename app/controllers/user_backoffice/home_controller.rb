class UserBackoffice::HomeController < LayoutUserController
  def index
    @user_backoffice_tasks = []

    @historyc = current_user.user_backoffice_tasks.where(status: "Concluída")
    @historyc.each do |task|
      @user_backoffice_tasks.push([task, User.find_by(id: task.user_id)])
    end
    
    @shared_with_user = current_user.user_backoffice_list_shareds
    @shared_with_user.each do |task|
      task = UserBackoffice::Task.find_by(id: task.user_backoffice_task_id)
      if task.status == "Concluída" && !@user_backoffice_tasks.any? { |existing_task, _| existing_task.id == task.id }
        @user_backoffice_tasks.push([task, User.find_by(id: task.user_id)])
      end
    end
  end
    
end
