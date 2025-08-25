class PostsController < ApplicationController
  allow_unauthenticated_access only: [ :index, :show ]
  # before action é uma forma de compartilhar codigo entre ações.
  # neste caso, show, edit e update tinham o mesmo codigo: "@post = Post.find(params[:id])
  # a before action existe para que não precisemos repetir o mesmo código
  # em diferentes lugares, alem de que a before action é executada
  # antes mesmo das ações, o que previne alguns erros, já que show, edit e update
  # necessitam de registros existentes no banco de dados
  before_action :set_post, only: [ :show, :edit, :update, :destroy ]

  def index
    # @posts é nossa variável de instanica que faz a querry de
    # selecionar todos os registros do banco de dados!
    @posts = Post.all
  end

  def show
  end

  # path do formulario de criação de nova postagem
  def new
    @post = Post.new
  end

  # query para a criação de um novo registro no banco de dados
  def create
    @post = Post.new(post_params)
    if @post.save
      redirect_to posts_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  # path para o formulario de edição de uma postagem, utilizando ID como parametro
  def edit
  end

  # query para edição do registro no banco de dados, utilizando o ID como parametro
  def update
    if @post.update(post_params)
      redirect_to posts_path
    else
      render :edit, status: unprocessable_entity
    end
  end

  # query para deletar um registro do banco de dados
  def destroy
    @post.destroy
    redirect_to posts_path
  end

  private
  # codigo compartilhado entre show, edit e update
  def set_post
    @post = Post.find(params[:id])
  end

  def post_params
    params.expect(post: [ :title, :content, :subtitle, :link ])
  end
end
