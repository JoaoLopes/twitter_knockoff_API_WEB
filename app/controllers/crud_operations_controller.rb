class CrudOperationsController < ApplicationController
  before_action :set_crud_operation, only: [:show, :edit, :update, :destroy]

  # GET /crud_operations
  # GET /crud_operations.json
  def index
    @crud_operations = CrudOperation.all
  end

  # GET /crud_operations/1
  # GET /crud_operations/1.json
  def show
  end

  # GET /crud_operations/new
  def new
    @crud_operation = CrudOperation.new
  end

  # GET /crud_operations/1/edit
  def edit
  end

  # POST /crud_operations
  # POST /crud_operations.json
  def create
    @crud_operation = CrudOperation.new(crud_operation_params)

    respond_to do |format|
      if @crud_operation.save
        format.html { redirect_to @crud_operation, notice: 'Crud operation was successfully created.' }
        format.json { render :show, status: :created, location: @crud_operation }
      else
        format.html { render :new }
        format.json { render json: @crud_operation.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /crud_operations/1
  # PATCH/PUT /crud_operations/1.json
  def update
    respond_to do |format|
      if @crud_operation.update(crud_operation_params)
        format.html { redirect_to @crud_operation, notice: 'Crud operation was successfully updated.' }
        format.json { render :show, status: :ok, location: @crud_operation }
      else
        format.html { render :edit }
        format.json { render json: @crud_operation.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /crud_operations/1
  # DELETE /crud_operations/1.json
  def destroy
    @crud_operation.destroy
    respond_to do |format|
      format.html { redirect_to crud_operations_url, notice: 'Crud operation was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_crud_operation
      @crud_operation = CrudOperation.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def crud_operation_params
      params.require(:crud_operation).permit(:crud_op, :role_id, :eval_exp)
    end
end
