<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class AddDataToPlans extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::table('plans', function (Blueprint $table) {
            $table->date('date')->nullable()->change();
            $table->renameColumn('date', 'date_start');
            $table->date('date_end')->nullable();
            $table->unsignedInteger('teacher_id')->nullable();

            $table->foreign('teacher_id')
                ->references('id')
                ->on('teachers')
                ->onDelete('cascade');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::table('plans', function (Blueprint $table) {
            $table->renameColumn('date_start', 'date')->change();
            $table->dropColumn('date_end');
            $table->dropColumn('teacher_id');
            $table->dropForeign(['teacher_id']);
        });
    }
}
