package br.com.programize.model;
import javax.persistence.Entity;

import lombok.*;

@Getter
@Setter
@Entity
@NoArgsConstructor
@AllArgsConstructor
public class Item extends Model{
	private String nome;
	private double preco;
	private String url;
}
