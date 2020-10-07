object gameflix {
	const property juegos = new Set()	
	const usuarios = new Set()
	
	method cobrar(){
		usuarios.forEach({ usuario => usuario.pagar() })
	}	
	method recomendacion() = juegos.anyOne()
	method busqueda(nombre) {
		try {
			return juegos.find({juego => juego.nombre().equals(nombre)})
		} catch exception : ElementNotFoundException {
			throw new JuegoNoEncontrado(message = "Juego no encontrado")
		}
//		const juegosQueCoinciden = juegos.filter({juego => juego.nombre().equals(nombre) })
//		if (juegosQueCoinciden.size()>0){
//			return juegosQueCoinciden.head()
//		} else {
//			throw new JuegoNoEncontrado(message = "Juego no encontrado")
//		}
	}
	method filtro(categoria) = juegos.filter({juego => juego.categoria().equals(categoria)})
}

class JuegoNoEncontrado inherits DomainException {}

class Juego {
	const property categoria
	const precio
	const nombre
	const tipo 
	
	method esBarato(){ precio < 30 }
	method afectar(alguien){ tipo.afectar(alguien) }
	
}

object violento {
	method afectar(alguien) {
		
	}
}

object terrorifico {
	method afectar(alguien) {
		alguien.actualizarSubscripcion(infantil)
	}
}

class Usuario {
	var subscripcion
	var dinero
	var humor
	
	method actualizarSubscripcion(_subscripcion){
		subscripcion = _subscripcion
	}
	method pagar(){}
	method jugar(juego){}
}

object premium {
	const property costo = 50
	method juegosPermitidos() = gameflix.juegos()
}

object base {
	const property costo = 25
	method juegosPermitidos() = gameflix.juegos().filter({ juego => juego.esBarato() })
}

object prueba {
	const property costo = 0
	method juegosPermitidos(){
		
	}
}

object infantil {
	const property costo = 10
	method juegosPermitidos(){
		
	}
}