<?PHP
// Definimos la clase
class Pokemon {
// Definimos sus atributos
    private $nombre;
    private $tipo;
    private $nivel;
    private $hp;
// Definimos su comportamiento
    public function __construct($nombre, $tipo, $nivel) {
        $this->nombre = $nombre;
        $this->tipo = $tipo;
        $this->nivel = $nivel;
        $this->hp = 100; // Le agregamos el valor por defecto en el constructor
    }
    public function atacar() {
        // Para hacer referencia a elementos dentro de la clase utiliza $this->atributo
        return $this->nombre . " usa ataque!";
    }
    public function getInfo()  {
        return "{$this->nombre}
        Tipo: {$this->tipo}
        Nivel: {$this->nivel}
        HP: {$this->hp}
        ";
    }

}
/*
$pkmn = new Pokemon();
echo $pkmn->getInfo() . "\n";
$pkmn->nombre = "Pikachu";
$pkmn->tipo = "Electrico";
$pkmn->nivel = 25;
$pkmn->hp = 100;
echo $pkmn->getInfo() . "\n";
*/
$pkmn = new Pokemon("Pikachu", "Electrico",25);
echo $pkmn->getInfo();
?>