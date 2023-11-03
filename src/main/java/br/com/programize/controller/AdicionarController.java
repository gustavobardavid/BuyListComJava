package br.com.programize.controller;

import javax.inject.Inject;
import javax.validation.Valid;

import br.com.caelum.vraptor.Controller;
import br.com.caelum.vraptor.Get;
import br.com.caelum.vraptor.Path;
import br.com.caelum.vraptor.Post;
import br.com.caelum.vraptor.Result;
import br.com.caelum.vraptor.validator.Validator;
import br.com.programize.dao.ItemDAO;
import br.com.programize.dao.ItemGenericDAO;
import br.com.programize.model.Item;

@Path("adicionar")
@Controller
public class AdicionarController {
	@Inject ItemDAO dao;
	@Inject Result result;
	@Inject Validator validator;
	@Get("")
	public void adicionar() {
		
	}
	
	@Post("validar")
	public void validar(@Valid Item item) {
		validator.onErrorRedirectTo(this).adicionar();
		dao.save(item);
		result.redirectTo(IndexController.class).index();			
	}
}
