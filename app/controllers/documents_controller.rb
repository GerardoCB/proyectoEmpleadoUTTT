class DocumentsController < ApplicationController

  def reporte_pdf
    begin
    @empleados = Empleado.all
    respond_to do |format|
      format.html
      format.pdf{render template: 'documents/reporte_pdf.pdf.erb',page_size: 'Letter',zoom: 1,background: true,margin: {top: 0,bottom:0,left:0,right:0}}
    end
      rescue Exception => e
      NotificacionMailer.aviso(e.message,e.backtrace.inspect).deliver
      redirect_to '/pagina_error'
    end
  end

  def pagina_error

  end

end
