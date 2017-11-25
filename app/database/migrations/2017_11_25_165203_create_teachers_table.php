<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateTeachersTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('teachers', function (Blueprint $table) {
            $table->increments('id');
            $table->string('first_name');
            $table->string('last_name');
            $table->string('email')->unique();
            $table->string('password');
            $table->dateTime('born_date');
            $table->unsignedInteger('status_id')->nullable();
            $table->unsignedInteger('high_status_id')->nullable();
            $table->unsignedInteger('department_id')->nullable();
            $table->unsignedInteger('plan_id')->nullable();

            $table->foreign('department_id')
                ->references('id')
                ->on('departments')
                ->onDelete('cascade');
            $table->foreign('status_id')
                ->references('id')
                ->on('statuses')
                ->onDelete('cascade');
            $table->foreign('high_status_id')
                ->references('id')
                ->on('high_statuses')
                ->onDelete('cascade');

            $table->foreign('plan_id')
                ->references('id')
                ->on('plans')
                ->onDelete('cascade');

            $table->rememberToken();
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('teachers');
    }
}
