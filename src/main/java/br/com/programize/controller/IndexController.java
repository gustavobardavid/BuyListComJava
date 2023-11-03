package br.com.programize.controller;

import java.util.List;

import javax.inject.Inject;

import br.com.caelum.vraptor.Controller;
import br.com.caelum.vraptor.Get;
import br.com.caelum.vraptor.Path;
import br.com.caelum.vraptor.Result;
import br.com.programize.dao.ItemDAO;
import br.com.programize.model.Item;

@Path("")
@Controller
public class IndexController {
	@Inject Result result;
	@Inject ItemDAO dao;
 	
	@Get("")
	public void index() {
		List<Item> itens = dao.findAll();
		result.include("itens", itens);
	}
}
