class ProductosController < ApplicationController
  before_action :set_producto, only: [:show, :edit, :update, :destroy]

  # GET /productos
  def index
    @productos = Producto.all
    respond_to do |format|
      format.html
      format.json { render json: @productos }
    end
  end

  # GET /productos/1
  def show
    respond_to do |format|
      format.html { render layout: false }
      format.json { render json: @producto }
    end
  end

  # GET /productos/new
  def new
    @producto = Producto.new
    respond_to do |format|
      format.html { render layout: false }
      format.json { render json: @producto }
    end
  end

  # GET /productos/1/edit
  def edit
    render layout: false
  end

  # POST /productos
  def create
    @producto = Producto.new(producto_params)

    respond_to do |format|
      if @producto.save
        format.html { redirect_to @producto }
        format.json { render json: @producto, status: :created }
        format.js
      else
        format.html { render :new }
        format.json { render json: @producto.errors, status: :unprocessable_entity }
        format.js
      end
    end
  end

  # PATCH/PUT /productos/1
  def update
    respond_to do |format|
      if @producto.update(producto_params)
        format.html { redirect_to @producto }
        format.json { head :no_content }
        format.js
      else
        format.html { render :edit }
        format.json { render json: @producto.errors, status: :unprocessable_entity }
        format.js
      end
    end
  end

  # DELETE /productos/1
  def destroy
    respond_to do |format|
      if @producto.destroy    
        format.html { redirect_to productos_url }
        format.json { head :no_content }
        format.js
      else
        format.html { redirect_to productos_url }
        format.json { render json: @producto.errors, status: :forbidden }
        format.js { render status: :forbidden }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_producto
      @producto = Producto.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def producto_params
      params.require(:producto).permit(:codigo, :codigo_proveedor, :proveedor, :importado, :categoria)
    end
end
