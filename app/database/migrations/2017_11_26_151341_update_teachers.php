<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class UpdateTeachers extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::table('teachers', function (Blueprint $table) {
            $table->string('avatar')->default('teacher_avatar.png');
            $table->dropForeign(['plan_id']);
            $table->dropColumn(['email', 'password', 'remember_token', 'plan_id']);
            $table->dropIndex('plan_id');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::table('teachers', function (Blueprint $table) {
            $table->dropColumn('avatar');
            $table->string('email')->unique();
            $table->string('password');
            $table->rememberToken();

            $table->unsignedInteger('plan_id')->nullable();
            $table->foreign('plan_id')
                ->references('id')
                ->on('plans')
                ->onDelete('cascade');
        });
    }
}
