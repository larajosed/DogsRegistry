<?php
 
namespace App\Http\Controllers;
 
use App\Dog;
use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
 
class DogController extends Controller
{
    /**
     * Get the dog with by the given id.
     *
     * @param  int  $id
     */
    public function getById($id) 
    {
        return Dog::findOrFail($id);
    }

    /**
     * Get all the dogs
     */
     public function getAll(){
         return Dog::all();
     }

     public function add(Request $request){
        $dog = New Dog();
        $dog->race = $request->input('race');
        $dog->size = $request->input('size');
        $dog->color = $request->input('color');
        $dog->photo = $request->input('photo');
        $dog->save();
     }
}