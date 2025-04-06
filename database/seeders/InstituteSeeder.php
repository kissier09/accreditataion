<?php

namespace Database\Seeders;

use App\Models\Institute;
use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;

class InstituteSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        Institute::create([
            'abbreviation' => 'EARIST', 
            'institute_name' => 'Eulogio "Amang" Rodriguez Institute of Science and Technology', 
            'dean' => null,
            'established' => null
        ]);
    }
}
