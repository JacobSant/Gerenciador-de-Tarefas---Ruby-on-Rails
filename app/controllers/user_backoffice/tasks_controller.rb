class UserBackoffice::TasksController < LayoutUserController
  before_action :set_user_backoffice_task, only: %i[ show edit update destroy]

  # GET /user_backoffice/tasks or /user_backoffice/tasks.json
  def index
    @user_backoffice_tasks = current_user.user_backoffice_tasks.where(shared: 0, status: "Não concluída")


    @user_backoffice_shared_tasks = current_user.user_backoffice_tasks.where(shared: 1,status: "Não concluída" )
    @shared_with_user = []

    @user_backoffice_shared_tasks.each do |task|
      shared_with_task = []
      UserBackoffice::ListShared.where(user_backoffice_task_id: task.id).each do |shared_task|
        shared_with_task.push(User.find_by(id: shared_task.user_id))
      end
      @shared_with_user.push([task, shared_with_task, User.find_by(id: task.user_id)])
      puts "++++++++++++++++++++++++++++++++++"
      puts task.inspect
    end
    
  end

  def complete
    
    @user_backoffice_task = UserBackoffice::Task.find(params[:id])
    
    @user_backoffice_task.update(status: "Concluída")
    redirect_to root_path, notice: "Tarefa concluida!"
  end

  def shared
    user = User.find_by(email: params[:email])
    if user
      @user_backoffice_task = UserBackoffice::Task.find_by(id: params[:id])
      if @user_backoffice_task.nil?
        redirect_to root_path, alert: "Tarefa não encontrada!"
        return
      end

      UserBackoffice::ListShared.create(
        user_backoffice_task_id: @user_backoffice_task.id,
        user_id: user.id
      )
      
      @user_backoffice_task.update(shared: 1)

      redirect_to root_path, notice: "Tarefa compartilhada com sucesso!"
    else
      redirect_to root_path, alert: "Usuário não encontrado!"
    end
  end

  # GET /user_backoffice/tasks/1 or /user_backoffice/tasks/1.json
  def show
  end

  # GET /user_backoffice/tasks/new
  def new
    @user_backoffice_task = UserBackoffice::Task.new
  end

  # GET /user_backoffice/tasks/1/edit
  def edit
  end

  # POST /user_backoffice/tasks or /user_backoffice/tasks.json
  def create
    task = user_backoffice_task_params
    task[:status] = params[:status]
    task[:user_id] = params[:user_id]

    @user_backoffice_task = UserBackoffice::Task.new(task)

    respond_to do |format|
      if @user_backoffice_task.save
        format.html { redirect_to user_backoffice_task_url(@user_backoffice_task), notice: "Tarefa criada com sucesso" }
        format.json { render :show, status: :created, location: @user_backoffice_task }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @user_backoffice_task.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /user_backoffice/tasks/1 or /user_backoffice/tasks/1.json
  def update
    respond_to do |format|
      if @user_backoffice_task.update(user_backoffice_task_params)
        format.html { redirect_to user_backoffice_task_url(@user_backoffice_task), notice: "Tarefa editada com sucesso" }
        format.json { render :show, status: :ok, location: @user_backoffice_task }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @user_backoffice_task.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /user_backoffice/tasks/1 or /user_backoffice/tasks/1.json
  def destroy
    @user_backoffice_task.destroy!

    respond_to do |format|
      format.html { redirect_to user_backoffice_tasks_url, notice: "Tarefa excluida com sucesso" }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user_backoffice_task
      @user_backoffice_task = UserBackoffice::Task.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def user_backoffice_task_params
      params.require(:user_backoffice_task).permit(:title, :description, :status, :priority, :shared, :user_id)
    end
end
