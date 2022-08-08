({
	invoke : function(component, event, helper) {
        var num = component.get("v.TipoMsg");
        var tipo = "error";
        var titulo = " ";
        if(num == 1)
        {
            tipo = "success";
            titulo = "Sucesso!";
        }
        else if(num == 2)
        {
            tipo = "warning";
            titulo = "Atenção!";
        }
        else if(num == 3)
        {
            tipo = "info";
            titulo = "Informação!";
        }
        else
        {
            tipo = "error";
            titulo = "Erro!";
        }
		var toastEvent = $A.get("e.force:showToast");
        toastEvent.setParams({
            "title": titulo,
            "type": tipo,
            "message": component.get("v.Mensagem")
        });
        toastEvent.fire();
	}
})